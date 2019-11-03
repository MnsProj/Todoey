//
//  Data.swift
//  Todoey
//
//  Created by abc on 26/10/19.
//  Copyright © 2019 abc. All rights reserved.
//

import Foundation
import RealmSwift

class Data: Object {
    //dynamic is a declaration modifier basically tells the runtime to dynamic dispatch over standard dispatch
    @objc dynamic var name: String = ""
    @objc dynamic var age: Int = 0
}
