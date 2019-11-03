//
//  item.swift
//  Todoey
//
//  Created by abc on 26/10/19.
//  Copyright © 2019 abc. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    // it has 3 properties
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated: Date?
    //inverse relationship to category             Type               Property name
    var parentCategory = LinkingObjects(fromType: Category.self,property: "items")
    
    
}
