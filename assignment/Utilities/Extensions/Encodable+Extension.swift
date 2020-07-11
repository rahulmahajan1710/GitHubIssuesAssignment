//
//  Encodable+Extension.swift
//  Assignment
//
//  Created by Rahul Mahajan on 11/07/209/05/20.
//  Copyright © 2020 Rahul Mahajan. All rights reserved.
//

import Foundation

extension Encodable {
    func toJSONData() -> Data? {
        return try? JSONEncoder().encode(self)
    }

    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
}
