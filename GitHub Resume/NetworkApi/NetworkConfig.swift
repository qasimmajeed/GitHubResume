//
//  NetworkConfig.swift
//  NetworkLayer
//
//  Created by Mohamed Qasim Mohamed Majeed on 24/11/2019.
//  Copyright © 2019 Lambda Tech. All rights reserved.
//

import Foundation

let kJSONValue = "application/json"
let kContentTypeHeader  = "Content-Type"
let kContentLengthHeader = "Content-Length"
let kRequestTimeOut = "30"
let kRequestParam = "param"

protocol EndPointType {
    var baseUrl : String! {get}
    var path : String! {get}
    var httpMethod : HttpMethod! {get}
    var httpRequest : URLRequest! {get}
    var paramters : [String : Any]! {get}
}
