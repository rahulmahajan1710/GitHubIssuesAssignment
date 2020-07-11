//
//  TypeAlias.swift
//  Assignment
//
//  Created by Rahul Mahajan on 11/07/209/05/20.
//  Copyright © 2020 Rahul Mahajan. All rights reserved.
//

import Foundation

typealias isCompleted = (Bool, String) -> Void
typealias isAlertCompleted = (Bool) -> Void
typealias JSONCompletionHandler = (String?, Error?) -> Void
typealias completionHandler = JSONCompletionHandler
