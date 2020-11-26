//
//  ResumeViewModel.swift
//  GitHub Resume
//
//  Created by Mohamed Qasim Mohamed Majeed on 24/11/2019.
//  Copyright © 2019 Lambda Tech. All rights reserved.
//

//
import Foundation
import UIKit

enum SectionType {
    case UserInfo
    case GitProfile
    case WebSite
    case Languages
    case Repositories
    case Organizations
}

struct ResumeViewModel {
    
    var sectionViewModels : [SectionViewModel] = [SectionViewModel]()
    var profileViewModel : ProfileViewModel!
    var userInfoViewModel : UserInfoViewModel!
    var repoViewModels : [RepoViewModel] = [RepoViewModel]()
    var webSiteViewModel : WebSiteViewModel!
    var organizarionViewModels : [OrganizationViewModel] = [OrganizationViewModel]()
    var languageViewModels : [LanguageViewModel] = [LanguageViewModel]()
    
    
    struct SectionViewModel {
        var title : String = ""
        var sectionCount : Int = 1
        var type : SectionType = .UserInfo
        
    }
    
    struct UserInfoViewModel {
        var userName : String!
        var caption : String!
        var avatarUrlString : String?
        var bio : String?
        var haveBio : Bool {
            return !(self.bio?.isEmpty ?? true)
        }
        
    }
    
    struct OrganizationViewModel{
        var companyName : String!
        var role : String!
        var companyDescription : String!
        var url : URL!
        
        
    }
    
    struct RepoViewModel {
        var repoName : String!
        var langaugeAndOwnerShip : String!
        var repoYear : String!
        var shortDescrption : String!
        var longDescription: String!
        var link : URL!
        
    }
    
    
    struct WebSiteViewModel {
        var linkText : String
        var isClickAble : Bool = false
        var link : URL!
        var color : UIColor = UIColor.black
        
    }
    
    struct ProfileViewModel {
        var profileText : String!
        var url : URL!
    }
    
    struct LanguageViewModel {
        var languageNameWithPercentage : String!
        var percentage : Int = 0
    }
    
    
    
}
