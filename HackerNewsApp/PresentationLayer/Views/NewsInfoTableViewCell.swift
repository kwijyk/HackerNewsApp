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
    
    func setupCell(title: String, createTime: String, isSelected: Bool) {
        self.titleLabel.text = title
        self.createTimeLabel.text = createTime
        self.selectedCellSwitch.isOn = isSelected
    }
    
}
