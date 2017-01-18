//
//  Model.swift
//  TestAlamofire
//
//  Created by 田腾飞 on 2016/12/12.
//  Copyright © 2016年 田腾飞. All rights reserved.
//

import UIKit

class Model: NSObject {
    let category: String
    let name: String
    
    init(category: String, name: String) {
        self.category = category
        self.name = name
    }
}
