//
//  NetworkError.swift
//  NetworkLayer
//
//  Created by Mohamed Qasim Mohamed Majeed on 24/11/2019.
//  Copyright © 2019 Lambda Tech. All rights reserved.
//

import Foundation

struct NetworkError {
    var statusCode : Int! {
        didSet{
            switch statusCode {
            case Int(CFNetworkErrors.cfurlErrorNotConnectedToInternet.rawValue):
                self.errorMessage = "requestCannotConnectToInternet"
            case 404:
                self.errorMessage = "Resource Not found"
                
            case Int(CFNetworkErrors.cfurlErrorCannotConnectToHost.rawValue):
                self.errorMessage = "UnableToAccessServer"
            case Int(CFNetworkErrors.cfurlErrorNotConnectedToInternet.rawValue):
                self.errorMessage = "requestCannotConnectToInternet"
            case Int(CFNetworkErrors.cfurlErrorUserAuthenticationRequired.rawValue):
                self.errorMessage =  "AuthorizationFailedAtServer"
            case Int(CFNetworkErrors.cfurlErrorUnsupportedURL.rawValue):
                self.errorMessage = "AuthorizationFailedAtServer"
            default:
                self.errorMessage = "UnableToAccessServer"
            }
            
        }
    }
    var errorMessage : String!
    var title : String! = "Error"
    
    
}
