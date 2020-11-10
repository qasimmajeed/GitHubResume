//
//  OrganizationRemoteRepository.swift
//  GitHub Resume
//
//  Created by Mohamed Qasim Mohamed Majeed on 24/11/2019.
//  Copyright © 2019 Lambda Tech. All rights reserved.
//

import Foundation

class OrganizationRemoteRepository: WebServiceApi {
    
    private var orgURl : String = ""
    
    override var baseUrl: String! {
        return self.orgURl
    }
    
    override var path: String! {
        return ""
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
    
    func getUserOrganizations(orgURL : String, complete :@escaping ([OrganizationBO]) -> Void, failure:@escaping onFailure) {
        self.orgURl = orgURL
        self.network.request(self.httpRequest, success: { (response : [OrganizationBO]) in
            complete(response)
            
        }) { (error : NetworkError) in
            failure(error)
        }
    }
    
    

}
