//
//  Milestone.swift
//  Assignment
//
//  Created by Rahul Mahajan on 11/07/2020.
//  Copyright © 2020 Rahul Mahajan. All rights reserved.
//

import Foundation

// MARK: - Milestone
struct Milestone: Codable {

    let url: String?
    let html_url: String?
    let labels_url: String?
    let id: Int?
    let node_id: String?
    let number: Int?
    let title: String?
    let milestoneDescription: String?
    let creator: User?
    let open_issues: Int?
    let closed_issues: Int?
    let state: String?
    let created_at: String?
    let updated_at: String?
    let due_on: String?
    let closed_at: String?

    enum CodingKeys: String, CodingKey {
        case url
        case html_url
        case labels_url
        case id
        case node_id
        case number
        case title
        case milestoneDescription = "description"
        case creator
        case open_issues
        case closed_issues
        case state
        case created_at
        case updated_at
        case due_on
        case closed_at
    }
}
