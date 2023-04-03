//
//  ArticleTableViewCell.swift
//  MVVM_Practice
//
//  Created by h on 2022/06/17.
//

import Foundation
import UIKit


class ArticleTableViewCell : UITableViewCell {
    
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var descriptionLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
