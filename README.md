# Welcome to the AwesomeExpandedTable

## Example

* To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements ##
* iOS 10.0+
* Xcode 9.2+
* Swift 4.1+

## Installation

>AwesomeExpandedTable is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'AwesomeExpandedTable'
```


## Communication ## 
* If you found a bug, open an issue.
* If you have a feature request, open an issue.
* If you want to contribute, submit a pull request.

## Instalation ##

All you need just drag and drop "Expand Table" folder to your project

## Usage ##

For use you can add as subclass "ExpandTableView" to your "UITableView" in storyboard or just use in code.
You can customize "ExpandTableCell" - as you like and every as you need.

"ExpandTableView" - use model "ExpandModel" so you can't update it as you need.
*

**Example for use: **

You can just download it or follow this step's

1) Firs of all you need to generate tableValue like this:

>     func generateTestValue() -> [String:Any] {
>         var parentValue:[String:Any] = [:]
>         parentValue = [
>             // root value /// not show in app
>             "name":"Value", "parent_id": 0, "category_id":0, "categories":
>                 
>                 // first drop
>                 [["name":"Value1", "parent_id": 1, "category_id":1, "categories":
>                         // second
>                         [["name":"Value1 child1", "category_id":2, "parent_id":1, "categories":[
>                                 //third
>                                 ["name":"Value1 child1 child1", "category_id":2, "parent_id":1],
>                                 ["name":"Value1 child1 child2", "category_id":2, "parent_id":1],
>                                 ["name":"Value1 child1 child3", "category_id":2, "parent_id":2]]],
>                          ["name":"Value1 child2", "category_id":3, "parent_id":1]]],
>                  // first
>                  ["name":"Value2", "category_id":5, "parent_id":2, "categories":
>                         // second
>                         [["name":"Value2 child1", "category_id":6, "parent_id":2],
>                          ["name":"Value2 child2", "category_id":7, "parent_id":2, "categories":[
>                                 //third
>                                 ["name":"Value2 child2 chidl1", "category_id":6, "parent_id":2],
>                                 ["name":"Value2 child2 chidl2", "category_id":6, "parent_id":2, "categories":[
>                                         //four
>                                         ["name":"Value2 child2 chidl2 child 1", "category_id":2, "parent_id":2],
>                                         ["name":"Value2 child2 chidl2 child 2", "category_id":2, "parent_id":2],
>                                         ["name":"Value2 child2 chidl2 child 3", "category_id":2, "parent_id":2]]],
>                                 ["name":"Value2 child3", "category_id":6, "parent_id":2]]],
>                          ["name":"Value2 child3", "category_id":7, "parent_id":2]]]
>             ]]
>         return parentValue
>     }


2) Next just init ExpandTableView

>      let table = ExpandTableView.init(generateTestValue(), rowHeight: 40, font: UIFont.systemFont(ofSize: 16), textColor: .gray, hide: false, isArrowFromLeft: false, imagesArray:[UIImage(named: "sU")!, UIImage(named: "sD")!])

3) You can download example app and look how it works.

4) Relax and Enjoy this Awesome Table View

## Author

Olegek Legek, <a href="http://MOVA.io">MOVA.io</a>, olegmytsouda@gmail.com
