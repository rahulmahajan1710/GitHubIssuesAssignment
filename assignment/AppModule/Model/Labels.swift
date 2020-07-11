//
//  Labels.swift
//  Assignment
//
//  Created by Rahul Mahajan on 11/07/2020.
//  Copyright © 2020 Rahul Mahajan. All rights reserved.
//

import Foundation

// MARK: - Label
struct Label: Codable {
    let id: Int?
    let node_id: String?
    let url: String?
    let name: String?
    let color: String?
    let labelDefault: Bool?
    let labelDescription: String?

    enum CodingKeys: String, CodingKey {
        case id
        case node_id
        case url, name, color
        case labelDefault = "default"
        case labelDescription = "description"
    }
}
