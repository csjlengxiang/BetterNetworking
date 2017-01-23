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
    
    func getCatrgories() -> Observable<[Model]> {
        return NewsProvider
            .request(.category)
            .mapArray(Model.self)
    }
}
