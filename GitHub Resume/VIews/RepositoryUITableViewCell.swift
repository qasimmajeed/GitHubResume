//
//  RepoSubUITableViewCell.swift
//  GitHub Resume
//
//  Created by Mohamed Qasim Mohamed Majeed on 22/11/2019.
//  Copyright © 2019 Lambda Tech. All rights reserved.
//

import UIKit

class RepositoryUITableViewCell: UITableViewCell {
    @IBOutlet weak var repoNameLabel : UILabel!
    @IBOutlet weak var languageAndOwnershipLabel : UILabel!
    @IBOutlet weak var yearCreationLabel : UILabel!
    @IBOutlet weak var shortDescriptionLabel : UILabel!
    @IBOutlet weak var longDescriptionLabel : UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    var viewModel : ResumeViewModel.RepoViewModel! {
        didSet {
            self.repoNameLabel.text = self.viewModel.repoName
            self.languageAndOwnershipLabel.text = self.viewModel.langaugeAndOwnerShip
            self.yearCreationLabel.text = self.viewModel.repoYear
            self.shortDescriptionLabel.text = self.viewModel.shortDescrption
            self.longDescriptionLabel.text = self.viewModel.longDescription
            
        }
    }
    
}
