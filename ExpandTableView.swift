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
    
    public init(_ data:[String:Any]) {
        super.init(frame: CGRect.zero, style: .plain)
        self.delegate = self
        self.dataSource = self
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
        return 40
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = self.model.flattenElements()[indexPath.row + 1]
        let cell = ExpandTableCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell", lev: model.getLevels() , expand: (model.inclusive), isSel: (model.isSelected))
        cell.valueLabel.text = model.value
        cell.model = model
        cell.arrowImage.isHidden = model.children.count == 0
        cell.delegate = self
        return cell
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
