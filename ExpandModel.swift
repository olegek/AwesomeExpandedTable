//
//  ExpandModel.swift
//  AwesomeExpandedTable
//
//  Created by Oleg Mytsovda on 09.08.18.
//  Copyright © 2018 Oleg Mytsovda. All rights reserved.
//

import UIKit

open class ExpandModel {
    
    var value = ""
    
    var categoryId: Int = 0
    var parentId: Int = 0
    
    var inclusive = false
    var isSelected = false
    
    var parent: ExpandModel?
    var children: [ExpandModel] = []
    var expandedElement: [ExpandModel] = []
    
    init(_ initValue: String, isInclusive:Bool) {
        value = initValue
        inclusive = isInclusive
        isSelected = false
    }
    
    func isRoot() -> Bool {
        return parent == nil
    }
    
    func hasChildren() -> Bool {
        return children.count > 1
    }
    
    func getLevels() -> Int {
        var count: Int = 0
        if let currentParent = parent {
            count = currentParent.getLevels() + 1 // 1 - it's parent row
        }
        return count
    }
    
    func childrensCount() -> Int {
        var count: Int = 0
        for child in children {
            if inclusive {
                count += 1
                if child.children.count > 0 {
                    count += child.childrensCount()
                }
            }
        }
        return count
    }
    
    func flattenElements() -> [ExpandModel] {
        expandedElement = []
        expandedElement.append(self)
        if inclusive {
            for child in children {
                let anInvalidate = child.flattenElements()
                expandedElement.append(contentsOf: anInvalidate)
            }
        }
        return expandedElement
    }
    
    func addChild(_ newChild: ExpandModel) {
        newChild.parent = self
        children.append(newChild)
    }
    
    // generate model
    
    static func generateModel(_ dict:[String:Any], inclusive:Bool) -> ExpandModel? {
        if let name = dict["name"] as? String {
            
            let model = ExpandModel.init(name, isInclusive: inclusive)
            
            if let catId = dict["category_id"] as? Int {
                model.categoryId = catId
            }
            
            if let parentId = dict["parent_id"] as? Int {
                model.parentId = parentId
            }
            
            return model
        } else {
            return nil
        }
    }
}
