//
//  OrganizationUITableViewCell.swift
//  GitHub Resume
//
//  Created by Mohamed Qasim Mohamed Majeed on 24/11/2019.
//  Copyright © 2019 Lambda Tech. All rights reserved.
//

import UIKit

class OrganizationUITableViewCell: UITableViewCell {
    @IBOutlet weak var organizationNameLabel : UILabel!
    @IBOutlet weak var memberLabel : UILabel!
    @IBOutlet weak var descriptionLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    var viewModel : ResumeViewModel.OrganizationViewModel! {
        didSet {
            self.organizationNameLabel.text = self.viewModel.companyName
            self.memberLabel.text = self.viewModel.role
            self.descriptionLabel.text = self.viewModel.companyDescription
           
            
        }
    }
    
    
}
