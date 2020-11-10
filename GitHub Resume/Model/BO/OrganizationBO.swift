//
//  OrganizationBO.swift
//  GitHub Resume
//
//  Created by Mohamed Qasim Mohamed Majeed on 24/11/2019.
//  Copyright © 2019 Lambda Tech. All rights reserved.
//

class OrganizationBO: BaseBO {
    
    var login: String!
    
    
    private enum CodingKeys : String ,CodingKey {
        case login = "login"

        
    }
    
    required public init(from decoder: Decoder) throws{
        try super.init(from: decoder)
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        if let elementValue = try? values.decode(String.self, forKey: .login) {
            login = elementValue
        }
        
        
        
    }
}
