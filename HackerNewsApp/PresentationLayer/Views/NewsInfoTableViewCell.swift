//
//  NewsInfoTableViewCell.swift
//  HackerNewsApp
//
//  Created by Serhii Haponov on 5/24/18.
//  Copyright © 2018 Serhii Haponov. All rights reserved.
//

import UIKit

class NewsInfoTableViewCell: UITableViewCell, NibLoadableView, ReusableView {

    @IBOutlet private weak var titleLabel: UILabel!
    
    @IBOutlet private weak var createTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setupCell(title: String, createTime: String) {
        self.titleLabel.text = title
        self.createTimeLabel.text = createTime
    }
    
}
