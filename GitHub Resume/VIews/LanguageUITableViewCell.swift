//
//  LanguageUITableViewCell.swift
//  GitHub Resume
//
//  Created by Mohamed Qasim Mohamed Majeed on 24/11/2019.
//  Copyright © 2019 Lambda Tech. All rights reserved.
//

import UIKit

class LanguageUITableViewCell: UITableViewCell {
    
    @IBOutlet weak var languageNameLabel : UILabel!
    @IBOutlet weak var progessIndicatorView : UIProgressView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    var viewModel : ResumeViewModel.LanguageViewModel! {
        didSet {
            self.languageNameLabel.text = self.viewModel.languageNameWithPercentage
            self.progessIndicatorView.progress = Float(self.viewModel.percentage) / 100
            
            
        }
    }
}
