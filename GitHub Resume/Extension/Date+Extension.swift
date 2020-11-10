//
//  Date+Extension.swift
//  GitHub Resume
//
//  Created by Mohamed Qasim Mohamed Majeed on 24/11/2019.
//  Copyright © 2019 Lambda Tech. All rights reserved.
//

import Foundation

extension Date {
    
    func getDateSperated() -> (year : Int, month : Int, day : Int){
        let calendar = Calendar.current
        let year =  calendar.component(.year, from: self)
        let month = calendar.component(.month, from: self)
        let day = calendar.component(.day, from: self)
        return (year : year, month : month, day : day)
    }
    
    
}
