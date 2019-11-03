//
//  Category.swift
//  Todoey
//
//  Created by abc on 26/10/19.
//  Copyright © 2019 abc. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object{    //Object is a Realm object  and we are saving our category data using realm
    @objc dynamic var name:String = ""     //name property
    @objc dynamic var dateCreated = Date() //dynamic variable we can see chenages in property like build time and run time
    let items = List<Item>()     // let array = Array<Int>() // List of item objects
                                 
}

