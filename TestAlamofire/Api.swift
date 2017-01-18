//
//  Api.swift
//  TestAlamofire
//
//  Created by 田腾飞 on 2016/12/12.
//  Copyright © 2016年 田腾飞. All rights reserved.
//

import UIKit
import Moya

let baseURL = "https://iu.snssdk.com"

/// 文章路径
let articlePath = "/article/category/get_subscribed/v1/"

/// iid
let iid = 6253487170

let NewsProvider = RxMoyaProvider<NewsService>()

public enum NewsService {
    case category
}

extension NewsService: TargetType {
    public var baseURL: URL {
        return URL(string: "https://iu.snssdk.com")!
    }
    
    public var path: String {
        switch self {
        case .category:
            return articlePath
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .category:
            return .get
        }
    }
    
    public var parameters: [String : Any]? {
        switch self {
        case .category:
            return ["iid": iid]
        }
    }
    
    public var parameterEncoding: ParameterEncoding {
        switch self {
        case .category:
            return URLEncoding.default
        }
    }
    
    public var task: Task {
        switch self {
        case .category:
            return .request
        }
    }
    
    public var sampleData: Data {
        switch self {
        case .category:
            return "".data(using: String.Encoding.utf8)!
        }
    }
}

