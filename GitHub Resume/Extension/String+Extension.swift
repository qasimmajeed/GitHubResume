//
//  String+Extension.swift
//  GitHub Resume
//
//  Created by Mohamed Qasim Mohamed Majeed on 24/11/2019.
//  Copyright © 2019 Lambda Tech. All rights reserved.
//
//
import Foundation

extension String {
    
    func toDate(_ formate : String) -> Date! {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formate
        return dateFormatter.date(from: self)
        
    }
    
    
     static func isStringValid(_ string: String?) -> Bool {
        if  string == nil{
            return false
        }
        
        var flage:Bool = false
        if !(string ?? "").isEmpty {
            flage = true
        }
        
        return flage
    }
    
    var urlEncodeString: String {
        let characterSetTobeAllowed = (CharacterSet(charactersIn: "!@#$%&*()+'\";:=,/?[] ").inverted)
        return self.addingPercentEncoding(withAllowedCharacters: characterSetTobeAllowed)!
    }
}
