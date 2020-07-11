//
//  RequestManager.swift
//  Assignment
//
//  Created by Rahul Mahajan on 11/07/2020.
//  Copyright © 2020 Rahul Mahajan. All rights reserved.
//

import Foundation

class RequestManager {
    class var sharedInstance :RequestManager {
        struct Singleton {
            static let instance = RequestManager()
        }
        return Singleton.instance
    }

    func withPost(apiConfiguration: APIConfiguration, completionHandler: @escaping JSONCompletionHandler) {
        let configuration = apiConfiguration.configuration()
        let session = URLSession(configuration: configuration)

        if let urlRequest = apiConfiguration.postURLRequest() {
            session.dataTask(with: urlRequest) { (data, response, error) in
                if let data = data {
                    if let json = String(data: data, encoding: String.Encoding.utf8) {
                        print("*** Response Json *** \n\(json)")
                        completionHandler(json, nil)
                    }
                    else {
                        completionHandler(nil, error)
                    }
                }
                else {
                    completionHandler(nil, error)
                }
            }.resume()
        }
    }

    func withGet(apiConfiguration: APIConfiguration, completionHandler: @escaping JSONCompletionHandler) {
        let configuration = apiConfiguration.configuration()
        let session = URLSession(configuration: configuration)

        if let urlRequest = apiConfiguration.getURLRequest() {
            session.dataTask(with: urlRequest) { (data, response, error) in
                if let data = data {
                    if let json = String(data: data, encoding: String.Encoding.utf8) {
                        print("*** Response Json *** \n\(json)")
                        completionHandler(json, nil)
                    }
                    else {
                        completionHandler(nil, error)
                    }
                }
                else {
                    completionHandler(nil, error)
                }
            }.resume()
        }
    }
}
