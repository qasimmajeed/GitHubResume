//
//  WebServiceApi.swift
//  NetworkLayer
//
//  Created by Mohamed Qasim Mohamed Majeed on 24/11/2019.
//  Copyright © 2019 Lambda Tech. All rights reserved.
//

import Foundation

typealias onFailure = (NetworkError?) -> Void

class WebServiceApi:  EndPointType {
    var network : NetworkApi!
    
    init(network : NetworkApi) {
        self.network = network
    }
    
    var baseUrl: String! { return nil }
    var path: String!{ return nil }
    var httpMethod: HttpMethod!{ return nil }
    var httpRequest: URLRequest!{ return nil }
    
    var url:String {
        let urlString  = self.baseUrl + self.path
        return urlString
        
    }
    
    var paramters: [String : Any]! { return nil }
    
    
}

