//
//  item.swift
//  Todoey
//
//  Created by abc on 16/10/19.
//  Copyright © 2019 abc. All rights reserved.
//

import Foundation
    
class Item:Codable {  //Item:Encodable,Decodable
    var title:String = ""
    var done: Bool = false
}
