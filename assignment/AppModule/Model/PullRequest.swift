//
//  PullRequest.swift
//  Assignment
//
//  Created by Rahul Mahajan on 11/07/2020.
//  Copyright © 2020 Rahul Mahajan. All rights reserved.
//

import Foundation

struct PullRequest: Codable {
    let url: String?
    let html_url: String?
    let diff_url: String?
    let patch_url: String?

    enum CodingKeys: String, CodingKey {
        case url
        case html_url
        case diff_url
        case patch_url
    }
}

