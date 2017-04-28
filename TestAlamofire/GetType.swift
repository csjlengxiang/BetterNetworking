//
//  GetAble.swift
//  
//
//  Created by csj on 2017/4/28.
//
//

import Foundation
import Moya


protocol BaseRequestTargetType: TargetType {
    
}

protocol GetType: BaseRequestTargetType {

}

protocol PostType: BaseRequestTargetType {
    
}

struct categoryApi: GetType {
    
    public var path: String {
        return "/article/category/get_subscribed/v1/"
    }
    
    public var parameters: [String : Any]? {
        // 需要被重构
        return ["iid": 6253487170]
    }
}

extension GetType {
    public var method: Moya.Method {
        return .get
    }
}

extension PostType {
    public var method: Moya.Method {
        return .post
    }
}

extension BaseRequestTargetType {
    public var baseURL: URL {
        return URL(string: "https://iu.snssdk.com")!
    }
    
    public var path: String {
        // 需要被重构
        print ("err")
        return "" // "/article/category/get_subscribed/v1/"
    }
    
    public var method: Moya.Method {
        // 需要被重构
        print ("err")
        return .get
    }
    
    public var parameters: [String : Any]? {
        // 需要被重构
        print ("err")
        return nil
    }
    
    public var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    public var task: Task {
        return .request
    }
    
    public var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
}
