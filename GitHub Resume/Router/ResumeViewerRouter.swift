//
//  ResumeViewerRouter.swift
//  GitHub Resume
//
//  Created by Mohamed Qasim Mohamed Majeed on 24/11/2019.
//  Copyright © 2019 Lambda Tech. All rights reserved.
//

import UIKit

protocol ResumeViewerRouterDataPassing {
    var userName : String! {get set}
}

class ResumeViewerRouter : ResumeViewerRouterDataPassing {
    
    var userName: String!
    
    weak var viewController : ResumeViewerViewController!
    
    init(viewController : ResumeViewerViewController!) {
        self.viewController = viewController
    }
    
    func openUrl(_ url : URL!)  {
        UIApplication.shared.open(url, options: [:]) { (completion) in
            
        }
    }
    

}
