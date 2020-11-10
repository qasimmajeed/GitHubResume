//
//  BaseBO.swift
//  GitHub Resume
//
//  Created by Mohamed Qasim Mohamed Majeed on 24/11/2019.
//  Copyright © 2019 Lambda Tech. All rights reserved.
//
import Foundation

class BaseBO: Decodable {
    
    var id: Int!
    var name : String!
     var url : String!
    var createdAt : Date!
    var updatedAt: Date!
    
    
    private enum CodingKeys : String ,CodingKey {
        case id = "id"
        case name = "name"
        case url = "url"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
    
    required public init(from decoder: Decoder) throws{
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        if let elementValue = try? values.decode(Int.self, forKey: .id) {
            id = elementValue
        }
        
        
        if let elementValue = try? values.decode(String.self, forKey: .name) {
            name = elementValue
        }
        
        if let elementValue = try? values.decode(String.self, forKey: .url) {
            url = elementValue
        }
        
        if let elementValue = try? values.decode(String.self, forKey: .createdAt) {
            createdAt = elementValue.toDate("yyyy-MM-dd'T'HH:mm:ssZZZZ")
        }
        
        if let elementValue = try? values.decode(String.self, forKey: .updatedAt) {
            updatedAt =  elementValue.toDate("yyyy-MM-dd'T'HH:mm:ssZZZZ")
        }
    }
}
