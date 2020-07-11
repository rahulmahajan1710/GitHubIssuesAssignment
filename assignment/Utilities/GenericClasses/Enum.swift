//
//  Enum.swift
//  Assignment
//
//  Created by Rahul Mahajan on 11/07/209/05/20.
//  Copyright © 2020 Rahul Mahajan. All rights reserved.
//
//

import Foundation

public enum HTTPMethod: String {
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}

public enum Storyboard: String {
    case LAUNCHSCREEN = "LaunchScreen"
    case MAIN = "Main"
}

public enum State: String {
    case open = "open"
    case closed = "closed"
}
