//
//  WebSiteTableViewCell.swift
//  GitHub Resume
//
//  Created by Mohamed Qasim Mohamed Majeed on 24/11/2019.
//  Copyright © 2019 Lambda Tech. All rights reserved.
//

import UIKit

class WebSiteTableViewCell: UITableViewCell {
    
    @IBOutlet weak var webSiteText : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    var viewModel : ResumeViewModel.WebSiteViewModel! {
        didSet {
            self.webSiteText.text = self.viewModel.linkText
            self.webSiteText.textColor = self.viewModel.color
            
        }
    }
    //ResumeViewModel.WebSiteViewModel
    
}
