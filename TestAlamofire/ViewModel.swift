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

class ViewModel: NSObject {
    let param = ["iid": iid]
    let url = baseURL + articlePath
    var models = [Model]()
    let disposeBag = DisposeBag()
    typealias Complete = ([Model]) -> Void
    
    func getCatrgories(complete: @escaping Complete) {
//        Alamofire.request(url, parameters: param).responseJSON { (response) in
//            switch response.result {
//            case .success(let value):
//                let json = JSON(value)
//                let jsonArray = json["data"]["data"]
//
//                for (_, subJson):(String, JSON) in jsonArray {
//                    let model = Model(category: subJson["category"].stringValue, name: subJson["name"].stringValue)
//                    self.models.append(model)
//                }
//            case .failure(let error):
//                print(error)
//            }
//            
//            complete(self.models)
//        }
        
//        NewsProvider.request(.category) { (result) in
//            switch result {
//            case let .success(value):
//                let json = JSON(data: value.data)
//                let jsonArray = json["data"]["data"]
//                for (_, subJson):(String, JSON) in jsonArray {
//                    let model = Model(category: subJson["category"].stringValue, name: subJson["name"].stringValue)
//                    self.models.append(model)
//                }
//                complete(self.models)
//            case let .failure(error):
//                print(error)
//            }
//        }
        
        NewsProvider.request(.category)
            .subscribe({ event in
                switch event {
                case .next(let value):
                    let json = JSON(data: value.data)
                    let jsonArray = json["data"]["data"]
                    for (_, subJson):(String, JSON) in jsonArray {
                        let model = Model(category: subJson["category"].stringValue, name: subJson["name"].stringValue)
                        self.models.append(model)
                    }
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
