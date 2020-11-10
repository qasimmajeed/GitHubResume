//
//  ResumeViewerViewController.swift
//  GitHub Resume
//
//  Created by Mohamed Qasim Mohamed Majeed on 24/11/2019.
//  Copyright © 2019 Lambda Tech. All rights reserved.
//

import UIKit

protocol ResumeViewerViewControllerDisplay : class {
    func displayResume(viewModel : ResumeViewModel!)
    func displayError(_ error : String)
}


class ResumeViewerViewController: UIViewController {
    
    @IBOutlet weak var tableView : UITableView!
    @IBOutlet weak var activityIndicator : UIActivityIndicatorView!
    
    var userName : String = ""
    
    var fake : Int = 0
    
    var viewModel : ResumeViewModel!
    
    private var interactor : ResumeViewerInteractor!
    private var router : ResumeViewerRouter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.activityIndicator.isHidden = true
        self.fetcData()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    
    //MARK: - View Methods
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.setup()
        
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        self.setup()
        
    }
    
    init(interactor: ResumeViewerInteractor! = nil, router : ResumeViewerRouter! = nil) {
        super.init(nibName: nil, bundle: nil)
        self.interactor = interactor
        self.router = router
    }
    
    private func setup(){
        let presenter = ResumeViewerPresenter(viewController: self)
        let worker : ResumeViewerWorker = ResumeViewerWorker.init(userRepo: UserRemoteRepository(network: NetworkApi()), organizationRepo: OrganizationRemoteRepository(network: NetworkApi()), repositoryRepo: RepoRemoteRepository(network: NetworkApi()))
        self.interactor = ResumeViewerInteractor.init(presenter: presenter, resumeWorker: worker)
        self.router = ResumeViewerRouter.init(viewController: self)
        
    }
    
    
    func fetcData()  {
        self.activityIndicator.isHidden = false
        self.interactor.fetchUserResume(userName)
    }
    
    deinit {
        print("deinit---- >",String(describing: self))
    }
    
    
    
}


extension ResumeViewerViewController : ResumeViewerViewControllerDisplay {
    func displayResume(viewModel: ResumeViewModel!) {
        self.fake = 5
        self.viewModel = viewModel
        DispatchQueue.main.async {
            self.activityIndicator.isHidden = true
            self.tableView.reloadData()
            
        }
        
        
    }
    
    func displayError(_ error: String) {
        let alert = UIAlertController(title: "", message:error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel , handler:{ (UIAlertAction)in
            self.navigationController?.popViewController(animated: true)
        }))
        
        DispatchQueue.main.async {
            self.activityIndicator.isHidden = true
            self.present(alert, animated: true, completion: {
                print("completion block")
            })
        }
        
        
        
    }
    
    
}


extension ResumeViewerViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        guard (self.viewModel != nil) else {
            return 0
        }
        return self.viewModel.sectionViewModels.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let viewModel : ResumeViewModel.SectionViewModel = self.viewModel.sectionViewModels[section]
        return viewModel.sectionCount
        
    }
}


extension ResumeViewerViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 { return nil }
        let header = ResumeTableViewHeader.fromNib()
        let viewModel : ResumeViewModel.SectionViewModel = self.viewModel.sectionViewModels[section]
        header?.viewModel = viewModel
        
        
        
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 { return 0 }
        return 50
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel : ResumeViewModel.SectionViewModel = self.viewModel.sectionViewModels[indexPath.section]
        
        if viewModel.type == .UserInfo {
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserInfoTableViewCell") as! UserInfoTableViewCell
            cell.viewModel = self.viewModel.userInfoViewModel
            return cell
            
        }else  if viewModel.type == .GitProfile {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileUITableVIewCell") as! ProfileUITableVIewCell
            cell.viewModel = self.viewModel.profileViewModel
            return cell
            
        }else if viewModel.type == .WebSite{
            let cell = tableView.dequeueReusableCell(withIdentifier: "WebSiteTableViewCell") as! WebSiteTableViewCell
            cell.viewModel = self.viewModel.webSiteViewModel
             cell.accessoryType = .none
            if self.viewModel.webSiteViewModel.isClickAble {
                 cell.accessoryType = .disclosureIndicator
            }
           
            return cell
            
        }else if viewModel.type == .Repositories {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RepositoryUITableViewCell") as! RepositoryUITableViewCell
            cell.viewModel = self.viewModel.repoViewModels[indexPath.row]
            cell.accessoryType = .disclosureIndicator
            return cell
            
        }else if viewModel.type == .Organizations{
            let cell = tableView.dequeueReusableCell(withIdentifier: "OrganizationUITableViewCell") as! OrganizationUITableViewCell
            cell.viewModel = self.viewModel.organizarionViewModels[indexPath.row]
            cell.accessoryType = .disclosureIndicator
            return cell
            
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LanguageUITableViewCell") as! LanguageUITableViewCell
            cell.viewModel = self.viewModel.languageViewModels[indexPath.row]
    
            return cell
        }
        
        //RepoMainUITableViewCell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let viewModel : ResumeViewModel.SectionViewModel = self.viewModel.sectionViewModels[indexPath.section]
        
        if viewModel.type == .UserInfo {
            
            
        }else  if viewModel.type == .GitProfile {
           
            
        }else if viewModel.type == .WebSite{
            if self.viewModel.webSiteViewModel.isClickAble {
                self.router.openUrl(self.viewModel.webSiteViewModel.link)
            }
            
            
        }else if viewModel.type == .Repositories {
            self.router.openUrl(self.viewModel.repoViewModels[indexPath.row].link)
           
            
        }else if viewModel.type == .Organizations{
            self.router.openUrl(self.viewModel.organizarionViewModels[indexPath.row].url)
            
        }else {
           
        }
        
    }
}

