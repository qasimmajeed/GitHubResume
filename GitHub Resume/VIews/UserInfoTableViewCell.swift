//
//  UserInfoTableViewCell.swift
//  GitHub Resume
//
//  Created by Mohamed Qasim Mohamed Majeed on 22/11/2019.
//  Copyright © 2019 Lambda Tech. All rights reserved.
//

import UIKit

class UserInfoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userNameLabel : UILabel!
    @IBOutlet weak var captionLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    var viewModel : ResumeViewModel.UserInfoViewModel! {
        didSet {
            self.userNameLabel.text = self.viewModel.userName
            self.captionLabel.text = self.viewModel.caption
        }
    }
    
}


