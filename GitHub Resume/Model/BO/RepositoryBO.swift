//
//  RepositoryBO.swift
//  GitHub Resume
//
//  Created by Mohamed Qasim Mohamed Majeed on 24/11/2019.
//  Copyright © 2019 Lambda Tech. All rights reserved.
//

class RepositoryBO: BaseBO {
    
    var description: String!
    var stargezersCount : Int64 = 0
    var forksCount :  Int64 = 0
    var fork :  Bool = false
    var language : String!
    var htmlUrl : String!
    
    private enum CodingKeys : String ,CodingKey {
        case description = "description"
        case stargezersCount = "stargazers_count"
        case forksCount = "forks_count"
        case fork = "fork"
        case language =  "language"
        case htmlUrl =  "html_url"
        
    }
    
    required public init(from decoder: Decoder) throws{
        try super.init(from: decoder)
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        if let elementValue = try? values.decode(String.self, forKey: .description) {
            description = elementValue
        }
        
        
        if let elementValue = try? values.decode(Int64.self, forKey: .stargezersCount) {
            stargezersCount = elementValue
        }
        
        if let elementValue = try? values.decode(Int64.self, forKey: .forksCount) {
            forksCount = elementValue
        }
        
        if let elementValue = try? values.decode(Bool.self, forKey: .fork) {
            fork = elementValue
        }
        
        if let elementValue = try? values.decode(String.self, forKey: .language) {
            language = elementValue
        }
        
        if let elementValue = try? values.decode(String.self, forKey: .htmlUrl) {
            htmlUrl = elementValue
        }
        
    }
    
    
    
}
