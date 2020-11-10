//
//  ResumeViewerWorker.swift
//  GitHub Resume
//
//  Created by Mohamed Qasim Mohamed Majeed on 24/11/2019.
//  Copyright © 2019 Lambda Tech. All rights reserved.
//

import Foundation

protocol ResumeViewerWorkerInput {
    func fetchUser( username:String, complete :@escaping (UserBO) -> Void, failure:@escaping onFailure)
    func fetchUserRepo( repoURL : String, complete :@escaping ([RepositoryBO]) -> Void, failure:@escaping onFailure)
    func fetchUserOrganization( orgURL : String, complete : @escaping ([OrganizationBO]) -> Void, failure:@escaping onFailure)
    
    
}


class ResumeViewerWorker: ResumeViewerWorkerInput {
    
    private var userRepo : UserRemoteRepository!
    private var organizationRepo : OrganizationRemoteRepository!
    private var repositoryRepo : RepoRemoteRepository!
    
    init(userRepo : UserRemoteRepository, organizationRepo : OrganizationRemoteRepository, repositoryRepo : RepoRemoteRepository ) {
        self.userRepo = userRepo
        self.organizationRepo = organizationRepo
        self.repositoryRepo = repositoryRepo
    }
    
    func fetchUser(username: String, complete: @escaping (UserBO) -> Void, failure: @escaping onFailure) {
        self.userRepo.fetchUser(username, complete: { (user) in
            complete(user)
        }) { (error) in
            failure(error)
        }
    }
    
    func fetchUserRepo(repoURL: String, complete: @escaping ([RepositoryBO]) -> Void, failure: @escaping onFailure) {
        self.repositoryRepo.getUserRepo(repoURL: repoURL, complete: { (repositories) in
            complete(repositories)
        }) { (error) in
            failure(error)
        }
    }
    
    func fetchUserOrganization(orgURL: String, complete: @escaping ([OrganizationBO]) -> Void, failure: @escaping onFailure) {
        self.organizationRepo.getUserOrganizations(orgURL: orgURL, complete: { (organizations) in
            complete(organizations)
        }) { (error) in
            failure(error)
        }
    }
    
    
   
    

}
