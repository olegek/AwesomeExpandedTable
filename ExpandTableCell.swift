//
//  ExpandTableCell.swift
//  AwesomeExpandedTable
//
//  Created by Oleg Mytsovda on 09.08.18.
//  Copyright © 2018 Oleg Mytsovda. All rights reserved.
//

import UIKit

public protocol CellSelectedDelegate {
    func cellChecked(_ value: Bool, andCell cell: UITableViewCell?)
}

open class ExpandTableCell: UITableViewCell {
    
    public var delegate:CellSelectedDelegate?
    
    public let valueLabel = UILabel()
    public let arrowImage = UIImageView()
    public let selectedButton = UIButton()
    
    open var model:ExpandModel?
    open var level = 0
    open var expanded = false
    open var isSelectedCell = false
    
    init(style: UITableViewCell.CellStyle, reuseIdentifier: String?, lev:Int, expand:Bool, isSel:Bool, leftSide:Bool) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.level = lev
        self.expanded = expand
        self.isSelectedCell = isSel
        
        let margin = leftSide ? 40 : 16
        
        self.contentView.addSubview(valueLabel)
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: CGFloat(margin * lev)).isActive = true
        valueLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0).isActive = true
        valueLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0).isActive = true
        valueLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -40).isActive = true
        valueLabel.numberOfLines = 0
        
        self.contentView.addSubview(arrowImage)
        arrowImage.translatesAutoresizingMaskIntoConstraints = false
        arrowImage.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0).isActive = true
        arrowImage.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0).isActive = true
        arrowImage.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        if leftSide {
            arrowImage.rightAnchor.constraint(equalTo: valueLabel.leftAnchor, constant: -8).isActive = true
        } else {
            arrowImage.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -16).isActive = true
        }
        arrowImage.contentMode = .scaleAspectFit
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override open func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override open func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.isSelectedCell = !self.isSelected
        delegate?.cellChecked(self.isSelectedCell, andCell: self)
    }
    
}
