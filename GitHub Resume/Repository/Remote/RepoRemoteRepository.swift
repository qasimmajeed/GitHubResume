//
//  RepoRemoteRepository.swift
//  GitHub Resume
//
//  Created by Mohamed Qasim Mohamed Majeed on 24/11/2019.
//  Copyright © 2019 Lambda Tech. All rights reserved.
//

import Foundation

class RepoRemoteRepository: WebServiceApi {
    
    private var repoURL : String = ""
    
     
    override var baseUrl: String! {
        return self.repoURL
    }
    
    override var path: String! {
        return "?per_page=100"
    }
    
    override var httpMethod: HttpMethod! {
        return .get
    }
    
    override var httpRequest: URLRequest! {
        var request = URLRequest.init(url: URL(string: self.url)!)
        request.setValue(kJSONValue, forHTTPHeaderField: kContentTypeHeader)
        request.httpMethod = self.httpMethod.rawValue
        return request
    }
    
    func getUserRepo(repoURL : String,  complete :@escaping ([RepositoryBO]) -> Void, failure:@escaping onFailure) {
        self.repoURL = repoURL
        self.network.request(self.httpRequest, success: { (response : [RepositoryBO]) in
            complete(response)
            
        }) { (error : NetworkError) in
            failure(error)
        }
    }
    
    

}
