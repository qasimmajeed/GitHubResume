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
    @IBOutlet weak var bioLabel : UILabel!
    @IBOutlet weak var profileImageView : AsyncImage!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupUI()
        // Initialization code
    }
    
    private func setupUI(){
        self.profileImageView.layer.cornerRadius = self.profileImageView.bounds.height/2
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    var viewModel : ResumeViewModel.UserInfoViewModel! {
        didSet {
            self.userNameLabel.text = self.viewModel.userName
            self.captionLabel.text = self.viewModel.caption
            guard let avatarString = viewModel.avatarUrlString else {
                
                return
            }
            self.bioLabel.text = viewModel.bio
            self.bioLabel.isHidden = !viewModel.haveBio
            self.profileImageView.loadUrl(URL(string: avatarString)!)
            
            
        }
    }
    
}


