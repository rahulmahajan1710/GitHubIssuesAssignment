//
//  Date+Extension.swift
//  Assignment
//
//  Created by Rahul Mahajan on 11/07/2020.
//  Copyright © 2020 Rahul Mahajan. All rights reserved.
//

import Foundation

extension Date {
    func toString(formate: String = "yyyy-MM-dd'T'HH:mm:ss.SSSZ") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = formate
        let myString = dateFormatter.string(from:self)
        return myString
    }
}
