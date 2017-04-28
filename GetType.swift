//
//  GetAble.swift
//  
//
//  Created by csj on 2017/4/28.
//
//

import Foundation



protocol GetAble: TargetType {
    
}

extension TargetType {
    
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
