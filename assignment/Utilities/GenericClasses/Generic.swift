//
//  Generic.swift
//  Assignment
//
//  Created by Rahul Mahajan on 11/07/209/05/20.
//  Copyright © 2020 Rahul Mahajan. All rights reserved.
//
//

import Foundation
import UIKit

final class Generic {

    static func getViewControllerFromStoryBoard<T: UIViewController>(type: T.Type, storyBoard: Storyboard) -> T? {
        var fullName: String = NSStringFromClass(T.self)
        let storyboard = UIStoryboard(name: storyBoard.rawValue, bundle: nil)
        if let range = fullName.range(of:".", options:.backwards, range:nil, locale: nil){
            fullName = String(fullName[range.upperBound...])
        }
        return storyboard.instantiateViewController(withIdentifier:fullName) as? T
    }
}
