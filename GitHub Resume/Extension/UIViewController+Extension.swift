//
//  UIViewController+Extension.swift
//  GitHub Resume
//
//  Created by Mohamed Qasim Mohamed Majeed on 24/11/2019.
//  Copyright © 2019 Lambda Tech. All rights reserved.
//

import UIKit
extension UIViewController   {
    class func instantiate<T: UIViewController>(storyboardName: String) -> T {
        
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main)
        let identifier = String(describing: self)
        return storyboard.instantiateViewController(withIdentifier: identifier) as! T
        
    }
    
}
