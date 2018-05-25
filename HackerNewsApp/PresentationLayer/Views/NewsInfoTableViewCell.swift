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
    
    @IBOutlet weak var selectedCellSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        selectedCellSwitch.setOn(selected, animated: animated)
    }

    func setupCell(title: String, createTime: String) {
        self.titleLabel.text = title
        self.createTimeLabel.text = createTime
    }
    
}
