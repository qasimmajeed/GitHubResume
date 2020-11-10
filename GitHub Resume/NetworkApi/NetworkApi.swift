//
//  NetworkApi.swift
//  NetworkLayer
//
//  Created by Mohamed Qasim Mohamed Majeed on 24/11/2019.
//  Copyright © 2019 Lambda Tech. All rights reserved.
//

import Foundation

class NetworkApi: NetworkRequest {
    
    var session : URLSession = URLSession.shared
    var currentTask : URLSessionTask!
    var url : URL! //Holds the current request url
    
    init() {
    }
    
    func request<T: Decodable>(_ request : URLRequest, success : @escaping ResultSuccess<T>,failure : @escaping ResultFailure){
        //In order to check the Current request is in work or used...
        
        if self.currentTask != nil {
            self.currentTask.cancel()
        }
         var networkError : NetworkError = NetworkError()
        self.currentTask = self.session.dataTask(with: request, completionHandler: { (data, response, error) in
            if let _ = error {//Check the client side error
                networkError.statusCode = Int(CFNetworkErrors.cfurlErrorCannotConnectToHost.rawValue)
                failure(networkError)
            }else{
                //Things begin for server side...
                guard let httpRespone = response as? HTTPURLResponse, (200...299).contains(httpRespone.statusCode) else {
                    networkError.statusCode = (response as? HTTPURLResponse)?.statusCode
                   failure(networkError)
                    return
                    
                }
                if let data = data {
                    //Hanlde data
                    print(String(decoding: data, as: UTF8.self))
                    if let responseObject = try? JSONDecoder().decode(T.self, from:data) {
                        success(responseObject)
                    }
                }
                
            }
        })
        self.currentTask.resume()
    }
    
    
    
}
