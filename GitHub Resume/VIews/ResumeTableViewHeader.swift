//
//  ResumeTableViewHeader.swift
//  GitHub Resume
//
//  Created by Mohamed Qasim Mohamed Majeed on 22/11/2019.
//  Copyright © 2019 Lambda Tech. All rights reserved.
//

import UIKit

class ResumeTableViewHeader: UIView {
    
    @IBOutlet weak var titleLabel : UILabel!

    class func fromNib() -> ResumeTableViewHeader?
    {
        var cell: ResumeTableViewHeader?
        let nibViews = Bundle.main.loadNibNamed("ResumeTableViewHeader", owner: nil, options: nil)
        for nibView in nibViews! {
            if let cellView = nibView as? ResumeTableViewHeader {
                cell = cellView
            }
        }
        return cell
        
    }
    
    var viewModel : ResumeViewModel.SectionViewModel! {
           didSet {
            self.titleLabel.text = viewModel.title
           }
       }

}
