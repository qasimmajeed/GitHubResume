//
//  AsyncImage.swift
//  Created by Mohamed Qasim Mohamed Majeed on 16/09/2020.
//  Copyright © 2020 Mohamed Qasim Majeed. All rights reserved.
//

import UIKit

fileprivate let imageCache = NSCache<NSString, UIImage>()

class AsyncImage: UIImageView {
    
    private var indicator : UIActivityIndicatorView = UIActivityIndicatorView(style: .medium)
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initializeContent()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.initializeContent()
        
    }
    
    private func initializeContent(){
        self.addSubview(self.indicator)
        self.indicator.translatesAutoresizingMaskIntoConstraints = false
        self.indicator.color = UIColor.gray
        self.indicator.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.indicator.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.indicator.hidesWhenStopped = true
        
        
    }
    
    
    func loadUrl(_ url : URL?) {
        guard let url = url else {
            return
        }
        self.indicator.startAnimating()
                 if let cacheImage = imageCache.object(forKey: url.absoluteString as NSString){
                     DispatchQueue.main.async {
                         self.image = cacheImage
                         self.indicator.stopAnimating()
                     }
                     
                 }else{
                     //Download image
                     URLSession.shared.dataTask(with: url) { (data, response, error) in
                         guard let data = data, error == nil else{
                             
                             return
                         }
                         let image =  UIImage(data: data)
                         imageCache.setObject(image!, forKey:  url.absoluteString as NSString)
                         DispatchQueue.main.async {
                             self.image = image
                             self.indicator.stopAnimating()
                             
                             
                             
                         }
                         
                     }.resume()
                     
                 }
    }
    
   
    
    
    
}

