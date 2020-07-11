//
//  APIConfiguration.swift
//  Assignment
//
//  Created by Rahul Mahajan on 11/07/2020.
//  Copyright © 2020 Rahul Mahajan. All rights reserved.
//

import Foundation
import UIKit

//This struct connect all the comon urls and api keys
struct Basic {
    static let url = "https://api.github.com"
    static let apiKey = ""
    static var TIME_OUT = 60.0
    let headerUsername = ""
    let headerPassword = ""
}

public struct HEADERS {
    static let urlEncoded: [String: String] = ["Content-Type":"application/x-www-form-urlencoded; charset=UTF-8","Accept":"application/json; charset=UTF-8","cache-control": "no-cache"]
    static let appJson: [String: String] = ["Content-Type":"application/json; charset=UTF-8", "Accept":"application/json; charset=UTF-8","cache-control": "no-cache"]
    static let multipart: [String: String] = ["Content-type": "multipart/form-data"]
}

struct API_MODULE {
    // place holder module name
    static let ALAMOFIRE_MODULE = "/repos/Alamofire"
}

struct API_METHODS {
    // place holder method name
    static let alamofire_issues = "/Alamofire/issues"
}

class APIConfiguration {
    var api_Module: String
    var api_Method: String
    var extraString: String
    var httpMethod: HTTPMethod
    var requestObject: Encodable?

    init(api_Module: String = "", api_Method: String = "", extraString: String = "", httpMethod: HTTPMethod = .get, requestObject: Encodable? = nil) {
        self.api_Module = api_Module
        self.api_Method = api_Method
        self.extraString = extraString
        self.httpMethod = httpMethod
        self.requestObject = requestObject
    }

    fileprivate func getUrl() -> URL? {

        let urlString = String(format: "%@%@%@%@", Basic.url, self.api_Module, self.api_Method, self.extraString)
        print("*** Request Url ***\n\(urlString)")
        return URL.init(string: urlString)
    }

    fileprivate func httpBody()-> Data? {
        var data: Data?
        if let jsonData = self.requestObject?.toJSONData() {
            let jsonString = String(data: jsonData, encoding: .utf8) ?? ""
            print("*** Request Json *** \n\(jsonString)")
            data = jsonString.replacingOccurrences(of: "\\", with: "", options: .literal, range: nil).data(using: .utf8, allowLossyConversion: false)
        }
        return data
    }

    func configuration() -> URLSessionConfiguration {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = Basic.TIME_OUT
        return configuration
    }

    func getURLRequest() -> URLRequest? {
        guard let url = getUrl() else { return nil }
        return URLRequest.init(url: url)
    }

    func postURLRequest() -> URLRequest? {
        guard let url = getUrl() else { return nil }
        var urlRequest = URLRequest.init(url: url)
        urlRequest.httpMethod = self.httpMethod.rawValue
        urlRequest.allHTTPHeaderFields = HEADERS.appJson
        urlRequest.httpBody = self.httpBody()
        return urlRequest
    }
}
