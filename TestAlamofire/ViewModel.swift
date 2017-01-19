//
//  ViewModel.swift
//  TestAlamofire
//
//  Created by 田腾飞 on 2016/12/12.
//  Copyright © 2016年 田腾飞. All rights reserved.
//

import UIKit
import Alamofire
import RxCocoa
import RxSwift
import SwiftyJSON
import Moya
import ObjectMapper

class ViewModel: NSObject {
    let param = ["iid": iid]
    let url = baseURL + articlePath
    var models = [Model]()
    let disposeBag = DisposeBag()
    typealias Complete = ([Model]) -> Void
    
    func getCatrgories(complete: @escaping Complete) {
        NewsProvider.request(.category)
            .subscribe({ event in
                switch event {
                case .next(let value):
                    let json = JSON(data: value.data)
                    let jsonArray = json["data"]["data"]
//                    for (_, subJson):(String, JSON) in jsonArray {
//                        let model = Mapper<Model>().map(JSON: subJson.object as! [String : Any])!
//                        self.models.append(model)
//                    }
                    let array = jsonArray.arrayObject as! [[String: Any]]
                    self.models = Mapper<Model>().mapArray(JSONArray: array)!
                    complete(self.models)
                case .error(let error):
                    print(error)
                case .completed:
                    return
                }
            })
            .addDisposableTo(disposeBag)
        
    }
}
