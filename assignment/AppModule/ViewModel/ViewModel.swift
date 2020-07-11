//
//  ViewModel.swift
//  Assignment
//
//  Created by Rahul Mahajan on 11/07/2020.
//  Copyright © 2020 Rahul Mahajan. All rights reserved.
//

import Foundation

class ViewModel {
    var state: State = .open
    var page: Int = 1
    var per_page: Int = 10
    var issuesData: IssuesModel = []
    func getIssueList(isCompleted: @escaping isCompleted) {
        let extraString = String(format: "?state=%@&page=%d&per_page=%d", state.rawValue, page, per_page)
        let apiconfiguration = APIConfiguration(api_Module: API_MODULE.ALAMOFIRE_MODULE, api_Method: API_METHODS.alamofire_issues, extraString: extraString, httpMethod: .get, requestObject: nil)
        RequestManager.sharedInstance.withGet(apiConfiguration: apiconfiguration) { [weak self] (response, error) in
            if error != nil {
                return
            }
            guard let response = response else { isCompleted(false, FAILED); return }
            let jsonData = Data(response.utf8)
            let decoder = JSONDecoder()
            let issues = try? decoder.decode(IssuesModel.self, from: jsonData)
            if self?.page == 1 {
                self?.issuesData.removeAll()
                self?.issuesData = (issues ?? [])
            }
            else {
                self?.issuesData.append(contentsOf: (issues ?? []))
            }
            isCompleted(true, SUCCESS)
        }
    }
}
