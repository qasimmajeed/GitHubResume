//
//  UserRemoteRepository.swift
//  GitHub Resume
//
//  Created by Mohamed Qasim Mohamed Majeed on 24/11/2019.
//  Copyright © 2019 Lambda Tech. All rights reserved.
//
import Foundation

fileprivate enum UserRemoteRepositoryType {
    case GetUser(userName : String)
}

class UserRemoteRepository: WebServiceApi {
    
    private var type : UserRemoteRepositoryType = .GetUser(userName: "")
    
    override var baseUrl: String! {
        return "https://api.github.com/users/"
    }
    
    override var path: String! {
        switch type {
        case .GetUser(let userName):
            return userName.urlEncodeString
        }
    }
    
    override var httpMethod: HttpMethod! {
        return .get
    }
    
    override var httpRequest: URLRequest! {
        var request = URLRequest.init(url: URL(string: self.url)!)
        request.httpMethod = self.httpMethod.rawValue
        return request
    }
    
    func fetchUser(_ username : String,complete :@escaping (UserBO) -> Void, failure:@escaping onFailure) {
        self.type = .GetUser(userName: username)
        self.network.request(self.httpRequest, success: { (response : UserBO) in
            complete(response)
        }) { (error : NetworkError) in
            failure(error)
        }
    }
    
    
    
    

}
