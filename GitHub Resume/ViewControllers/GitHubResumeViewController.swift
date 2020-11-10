//
//  ViewController.swift
//  GitHub Resume
//
//  Created by Mohamed Qasim Mohamed Majeed on 24/11/2019.
//  Copyright © 2019 Lambda Tech. All rights reserved.
//

import UIKit

class GitHubResumeViewController : UIViewController {
    
    @IBOutlet weak var texField : UITextField!
    
    private var router : GitHubResumeRouter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
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
    
    init( router : GitHubResumeRouter! = nil) {
        super.init(nibName: nil, bundle: nil)
        self.router = router
    }
    
    private func setup(){
        self.router = GitHubResumeRouter.init(viewController: self)
        
    }
    
    @IBAction func generateNowAction(_ sender : UIButton!){
        self.router.showResume(self.texField.text!)
        
    }
    
    
    
    
}

