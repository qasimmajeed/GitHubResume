//
//  ResumeViewerPresenter.swift
//  GitHub Resume
//
//  Created by Mohamed Qasim Mohamed Majeed on 24/11/2019.
//  Copyright © 2019 Lambda Tech. All rights reserved.
//

import UIKit

protocol ResumeViewerPresenterLogic
{
    func presentResumeData(resume : ResumeBO)
    func presentError(error : NetworkError)
}

class ResumeViewerPresenter: ResumeViewerPresenterLogic {
    
    private weak var viewController : ResumeViewerViewControllerDisplay!
    
    
    init(viewController : ResumeViewerViewControllerDisplay) {
        self.viewController = viewController
    }
    
    func presentResumeData(resume: ResumeBO) {
        var resumeViewModel : ResumeViewModel = ResumeViewModel()
        
        //View binding for User Information
        resumeViewModel.sectionViewModels.append(ResumeViewModel.SectionViewModel(title: "", sectionCount: 1, type: .UserInfo))
        resumeViewModel.userInfoViewModel = ResumeViewModel.UserInfoViewModel(userName: resume.user.name ?? "", caption: "Passionate GitHub user")
        
        
        
        //View binding for Git Profile
        var profileText = "On GitHub since \(resume.user.createdAt.getDateSperated().year), \(resume.user.name ?? "")"
        if String.isStringValid(resume.user.location){
            profileText += " is a developer based in \(resume.user.location!)"
        }else {
            profileText += " is a developer"
        }
        profileText += " with " + "\(resume.user.publicRepos ?? 0) public repositories and \(resume.user.followers ?? 0) followers."
        
        resumeViewModel.sectionViewModels.append(ResumeViewModel.SectionViewModel(title: "GitHub Profile", sectionCount: 1, type: .GitProfile))
        resumeViewModel.profileViewModel = ResumeViewModel.ProfileViewModel(profileText: profileText, url: URL.init(string: resume.user.url) ?? nil)
        
        
        
        //View binding for website
        var webSiteVIewModel : ResumeViewModel.WebSiteViewModel = ResumeViewModel.WebSiteViewModel(linkText: "Not available", isClickAble: false, link: nil)
        
        if String.isStringValid(resume.user.blog)  {
            webSiteVIewModel.linkText = resume.user.blog
            webSiteVIewModel.isClickAble = true
            webSiteVIewModel.link = URL.init(string: resume.user.blog)
            webSiteVIewModel.color = UIColor.link
            
        }
        resumeViewModel.sectionViewModels.append(ResumeViewModel.SectionViewModel(title: "Website", sectionCount: 1, type: .WebSite))
        resumeViewModel.webSiteViewModel = webSiteVIewModel
        
        //View bidnding for languages
        var totalCount : Int = 0
        for (_ , value) in resume.languages {
            totalCount += value
        }
        
        for (key , value) in resume.languages {
            let percentage = Double(value)/Double(totalCount) * 100

            resumeViewModel.languageViewModels.append(ResumeViewModel.LanguageViewModel(languageNameWithPercentage: key + "(\(Int(percentage))%)", percentage: Int(percentage)))
        }
        resumeViewModel.sectionViewModels.append(ResumeViewModel.SectionViewModel(title: "Languages", sectionCount: resumeViewModel.languageViewModels.count, type: .Languages))
        
        
        
        //View binding for repository
        for item in resume.repos {
            
            var creationAndUpdate : String = ""
            if item.createdAt.getDateSperated().year != item.updatedAt.getDateSperated().year {
                creationAndUpdate = "\(item.createdAt.getDateSperated().year) - \(item.updatedAt.getDateSperated().year)"
            }else {
                creationAndUpdate = "\(item.createdAt.getDateSperated().year)"
            }
            
            let longDescriptionText = "This repository has \(item.stargezersCount) and \(item.forksCount) forks. If you would like more information about this repository and my contributed code, please tap to visit the repo on GitHub."
            
            
            resumeViewModel.repoViewModels.append(ResumeViewModel.RepoViewModel(repoName: item.name, langaugeAndOwnerShip: item.language ?? "" + " – Creator & Owner", repoYear: creationAndUpdate, shortDescrption: item.description, longDescription: longDescriptionText, link: URL.init(string: item.htmlUrl)!))
        }
        
        if resumeViewModel.repoViewModels.count > 0 {
             resumeViewModel.sectionViewModels.append(ResumeViewModel.SectionViewModel(title: "Popular Repositories", sectionCount: resumeViewModel.repoViewModels.count, type: .Repositories))
        }
        
        //View binding for organizations
        for item in resume.organizations {
            resumeViewModel.organizarionViewModels.append(ResumeViewModel.OrganizationViewModel(companyName: item.login, role: "Member", companyDescription: "If you would like more information about this organization, please tap to visit the organization page on GitHub.", url:  URL.init(string: "https://github.com/\(item.login!)") ?? nil))
            
        }
        
        if resumeViewModel.organizarionViewModels.count > 0 {
            resumeViewModel.sectionViewModels.append(ResumeViewModel.SectionViewModel(title: "Organizations", sectionCount: resumeViewModel.organizarionViewModels.count, type: .Organizations))
        }
        
        
        
        self.viewController.displayResume(viewModel: resumeViewModel)
        
    }
    
    func presentError(error: NetworkError) {
        self.viewController.displayError(error.errorMessage)
        
    }
    
    
}
