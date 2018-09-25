//
//  ViewController.swift
//  AwesomeExpandedTable
//
//  Created by olegek on 09/20/2018.
//  Copyright (c) 2018 olegek. All rights reserved.
//

import UIKit
import AwesomeExpandedTable

class ViewController: UIViewController, ExpandTableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        addTableView()
    }

    func generateTestValue() -> [String:Any] {
        var parentValue:[String:Any] = [:]
        parentValue = [
            // root value /// not show in app
            "name":"Value", "parent_id": 0, "category_id":0, "categories":
                
                // first drop
                [["name":"Value1", "parent_id": 1, "category_id":1, "categories":
                    // second
                    [["name":"Value1 child1", "category_id":2, "parent_id":1, "customExImage":"s2U", "customNonExImage":"s2D", "categories":[
                        //third
                        ["name":"Value1 child1 child1", "category_id":2, "parent_id":1],
                        ["name":"Value1 child1 child2", "category_id":2, "parent_id":1],
                        ["name":"Value1 child1 child3", "category_id":2, "parent_id":2]]],
                     ["name":"Value1 child2", "category_id":3, "parent_id":1]]],
                 // first
                    ["name":"Value2", "category_id":2, "parent_id":2, "categories":
                        // second
                        [["name":"Value2 child1", "category_id":2, "parent_id":2],
                         ["name":"Value2 child2", "category_id":2, "parent_id":2, "categories":[
                            //third
                            ["name":"Value2 child2 chidl1", "category_id":3, "parent_id":2],
                            ["name":"Value2 child2 chidl2", "category_id":3, "customExImage":"test", "customNonExImage":"test", "parent_id":2, "categories":[
                                //four
                                ["name":"Value2 child2 chidl2 child 1", "category_id":2, "parent_id":2],
                                ["name":"Value2 child2 chidl2 child 2", "category_id":2, "parent_id":2],
                                ["name":"Value2 child2 chidl2 child 3", "category_id":2, "parent_id":2]]],
                            ["name":"Value2 child3", "category_id":3, "parent_id":2]]],
                         ["name":"Value2 child3", "category_id":3, "parent_id":2]]]
            ]]
        return parentValue
    }
    
    func addTableView() {
        let table = ExpandTableView.init(generateTestValue(), rowHeight: 40, font: UIFont.systemFont(ofSize: 16), textColor: .gray, hide: false, isArrowFromLeft: false, imagesArray:[UIImage(named: "sU")!, UIImage(named: "sD")!])
        self.view.addSubview(table)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        table.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        table.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        table.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        table.backgroundColor = .white
        table.expandDelegate = self
    }
    
    func getSelectedElement(_ element: ExpandModel) {
        print("selected element \(element)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

