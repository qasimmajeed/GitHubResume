//
//  GitHubResumeRouter.swift
//  GitHub Resume
//
//  Created by Mohamed Qasim Mohamed Majeed on 24/11/2019.
//  Copyright © 2019 Lambda Tech. All rights reserved.
//

import Foundation

class GitHubResumeRouter {
    //var userName: String!
    weak var viewController : GitHubResumeViewController!
    
    init(viewController : GitHubResumeViewController) {
        self.viewController = viewController
    }
    
    func showResume(_ userName : String)  {
        let resumeViewer : ResumeViewerViewController = ResumeViewerViewController.instantiate(storyboardName: "Main")
        resumeViewer.userName = userName
        self.viewController.navigationController?.pushViewController(resumeViewer, animated: true)
    }
    
}
