//
//  ResumeViewerInteractor.swift
//  GitHub Resume
//
//  Created by Mohamed Qasim Mohamed Majeed on 24/11/2019.
//  Copyright © 2019 Lambda Tech. All rights reserved.
//

import Foundation

protocol ResumeViewerInteractorInput {
    func fetchUserResume(_ userName : String)
    func getHeadertitle(_ isDisplay : Bool) -> String
}

protocol ResumeViewerInteractorDataStore
{
    var resume: ResumeBO! { get }
}

class ResumeViewerInteractor: ResumeViewerInteractorInput, ResumeViewerInteractorDataStore {
    var resume: ResumeBO!
    
    private var resumeWorker : ResumeViewerWorker
    private var presenter : ResumeViewerPresenterLogic
    
    init(presenter : ResumeViewerPresenterLogic, resumeWorker : ResumeViewerWorker) {
        self.resumeWorker = resumeWorker
        self.presenter = presenter
    }
    
    func fetchUserResume(_ userName: String) {
        self.resumeWorker.fetchUser(username: userName, complete: { (user) in
            
            self.resume =  ResumeBO()
            self.resume.user = user
            
            self.resumeWorker.fetchUserOrganization(orgURL: self.resume.user.organizationsURL, complete: { (organizations) in
                
                self.resume.organizations = organizations
                self.resumeWorker.fetchUserRepo(repoURL: self.resume.user.reposURL, complete: {[weak self] (repositories) in
                    if let weakSelf = self {
                        var repo = repositories.sorted(by: { $0.stargezersCount > $1.stargezersCount })
                        repo = repo.filter{$0.fork == false}
                        weakSelf.resume.repos =  Array(repo.prefix(5))
                        
                        
                        var languagesName : [String] = [String]()
                        for item in repo {
                            if String.isStringValid(item.language) {
                                languagesName.append(item.language)
                            }
                        }
                        
                        let mapLanguages = languagesName.map { ($0, 1) }
                        let languagesWithCount = Dictionary(mapLanguages, uniquingKeysWith: +)
                        weakSelf.resume.languages = languagesWithCount
                        
                        weakSelf.presenter.presentResumeData(resume: weakSelf.resume)
                        
                    }
                    
                }) {[weak self] (error) in
                    if let weakSelf = self { weakSelf.presenter.presentError(error: error!) }
                }
                
            }) { [weak self](error) in
                if let weakSelf = self { weakSelf.presenter.presentError(error: error!) }
            }
        }) { [weak self](error) in
            if let weakSelf = self { weakSelf.presenter.presentError(error: error!) }
        }
        
    }
    
    
    func getHeadertitle(_ isDisplay : Bool) -> String{
        self.presenter.presentNavigationTitle(resume:self.resume , isDisplay: isDisplay)
        
    }
    
    
    
    
}
