//
//  ExpandCustomizeTableCell.swift
//  AwesomeExpandedTable_Example
//
//  Created by Oleg Mytsovda on 24.09.18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import AwesomeExpandedTable

class ExpandCustomizeTableCell: ExpandTableCell {
    
    convenience init(style: UITableViewCellStyle, reuseIdentifier: String?, lev:Int, expand:Bool, isSel:Bool) {
        self.init(style: style, reuseIdentifier: reuseIdentifier, lev: lev, expand: expand, isSel: isSel)
        self.level = lev
        self.expanded = expand
        self.isSelectedCell = isSel
        
        self.contentView.addSubview(valueLabel)
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: CGFloat(16 * lev)).isActive = true
        valueLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0).isActive = true
        valueLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0).isActive = true
        valueLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -100).isActive = true
        valueLabel.textColor = .black
        
        self.contentView.addSubview(arrowImage)
        arrowImage.translatesAutoresizingMaskIntoConstraints = false
        arrowImage.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0).isActive = true
        arrowImage.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0).isActive = true
        arrowImage.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -16).isActive = true
        arrowImage.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        let frameworkBundle = Bundle(for: ExpandTableCell.self)
        let bundleURL = frameworkBundle.resourceURL?.appendingPathComponent("AwesomeExpandedTable.bundle")
        let resourceBundle = Bundle(url: bundleURL!)
        let image = UIImage(named: self.expanded ? "up" : "down", in: resourceBundle, compatibleWith: nil)
        arrowImage.image = image
        arrowImage.contentMode = .scaleAspectFit
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
