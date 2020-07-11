//
//  IssuesModel.swift
//  Assignment
//
//  Created by Rahul Mahajan on 11/07/2020.
//  Copyright © 2020 Rahul Mahajan. All rights reserved.
//

import Foundation

typealias IssuesModel = [Issues]

// MARK: - Issues
struct Issues: Codable {
    let url: String?
    let repository_url: String?
    let labels_url: String?
    let comments_url: String?
    let events_url: String?
    let html_url: String?
    let id: Int?
    let node_id: String?
    let number: Int?
    let title: String?
    let user: User?
    let labels: [Label]?
    let state: String?
    let locked: Bool?
    let assignee: User?
    let assignees: [User]?
    let milestone: Milestone?
    let comments: Int?
    let created_at: String?
    let updated_at: String?
    let closed_at: String?
    let author_association: String?
    let active_lock_reason: String?
    let pull_request: PullRequest?
    let body: String?

    enum CodingKeys: String, CodingKey {
        case url
        case repository_url
        case labels_url
        case comments_url
        case events_url
        case html_url
        case id
        case node_id
        case number
        case title
        case user
        case labels
        case state
        case locked
        case assignee
        case assignees
        case milestone
        case comments
        case created_at
        case updated_at
        case closed_at
        case author_association
        case active_lock_reason
        case pull_request
        case body
    }
}
