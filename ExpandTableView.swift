//
//  ExpandTableView.swift
//  AwesomeExpandedTable
//
//  Created by Oleg Mytsovda on 09.08.18.
//  Copyright © 2018 Oleg Mytsovda. All rights reserved.
//

import UIKit

public protocol ExpandTableViewDelegate {
    func getSelectedElement(_ element:ExpandModel)
}

open class ExpandTableView: UITableView, UITableViewDelegate, UITableViewDataSource, CellSelectedDelegate {
    
    public var expandDelegate:ExpandTableViewDelegate?
    
    public var model = ExpandModel("ROOT", isInclusive: true)
    
    public var categories:[String:Any] = [:]
    
    // customizing value
    
    public var heightRow = 40
    
    public var valueFont = UIFont.systemFont(ofSize: 14)
    public var valueColor = UIColor.black
    
    public var arrowHidden = false
    public var isArrowLeft = false
    
    public var imageArrays:[UIImage] = []
    
    public init(_ data:[String:Any], rowHeight:Int = 40, font:UIFont = UIFont.systemFont(ofSize: 14), textColor:UIColor = UIColor.black, hide:Bool = false, isArrowFromLeft:Bool = false, imagesArray:[UIImage]) {
        super.init(frame: CGRect.zero, style: .plain)
        self.delegate = self
        self.dataSource = self
        self.heightRow = rowHeight
        self.valueFont = font
        self.valueColor = textColor
        self.arrowHidden = hide
        self.isArrowLeft = isArrowFromLeft
        self.imageArrays = imagesArray
        
        generateValues(data, model)
        self.register(ExpandTableCell.self, forCellReuseIdentifier: "cell")
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func generateValues(_ parentdict: [String : Any], _ parentModel: ExpandModel) {
        var parentDict = parentdict
        var childrenDict: [String : Any] = [:]
        if let categories = parentDict["categories"] as? [[String:Any]] {
            let count = categories.count
            for index in 0...count - 1  {
                let category = categories[index]
                if let model = ExpandModel.generateModel(category, inclusive: false) {
                    parentModel.addChild(model)
                    childrenDict = categories[index]
                    generateValues(childrenDict, model)
                }
            }
        }
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.childrensCount()
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(self.heightRow)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = self.model.flattenElements()[indexPath.row + 1]
        let cell = ExpandTableCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell", lev: model.getLevels() , expand: (model.inclusive), isSel: (model.isSelected), leftSide:self.isArrowLeft)
        cell.valueLabel.text = model.value
        
        cell.valueLabel.font = self.valueFont
        cell.valueLabel.textColor = self.valueColor
        
        cell.model = model
        
        if self.arrowHidden {
            cell.arrowImage.isHidden = true
        } else {
            cell.arrowImage.isHidden = model.children.count == 0
            self.setupImageForCell(model, cell: cell)
        }
        
        cell.delegate = self
        
        return cell
    }
    
    func setupImageForCell(_ model:ExpandModel, cell:ExpandTableCell) {
        if self.imageArrays.count == 2 {
            cell.arrowImage.image = (model.inclusive) ?  self.imageArrays[0] : self.imageArrays[1]
        } else {
            let frameworkBundle = Bundle(for: ExpandTableCell.self)
            let image = UIImage(named: (model.inclusive) ? "up" : "down", in: frameworkBundle, compatibleWith: nil)
            cell.arrowImage.image = image
        }
        if model.inclusive {
            if let image = model.expandedImage {
                cell.arrowImage.image = image
            }
        } else {
            if let image = model.nonExpandedImage {
                cell.arrowImage.image = image
            }
        }
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = self.model.flattenElements()[indexPath.row + 1]
        if !model.hasChildren() {
            return
        }
        model.inclusive = !model.inclusive
        tableView.reloadData()
    }
    
    public func cellChecked(_ value: Bool, andCell cell: UITableViewCell?) {
        var indexPath: IndexPath? = nil
        if let currentCell = cell {
            indexPath = self.indexPath(for: currentCell)
        }
        if let currentIndexPath = indexPath {
            let model = self.model.flattenElements()[currentIndexPath.row + 1]
            if !model.hasChildren() {
                expandDelegate?.getSelectedElement(model)
            }
        }
    }
    
}
