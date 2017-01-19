//
//  Model.swift
//  TestAlamofire
//
//  Created by 田腾飞 on 2016/12/12.
//  Copyright © 2016年 田腾飞. All rights reserved.
//

import UIKit
import ObjectMapper

class Model: Mappable {
    var category: String?
    var name: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        category    <- map["category"]
        name        <- map["name"]
    }
}
