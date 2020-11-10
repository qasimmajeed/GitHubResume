//
//  InfoTableViewCell.swift
//  GitHub Resume
//
//  Created by Mohamed Qasim Mohamed Majeed on 22/11/2019.
//  Copyright © 2019 Lambda Tech. All rights reserved.
//

import UIKit

class ProfileUITableVIewCell: UITableViewCell {
    
    @IBOutlet weak var profileText : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    var viewModel : ResumeViewModel.ProfileViewModel! {
        didSet {
            self.profileText.text = self.viewModel.profileText
        }
    }
    
    
    
}
