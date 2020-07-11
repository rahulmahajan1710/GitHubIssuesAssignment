//
//  UINavigationController+Extension.swift
//  Assignment
//
//  Created by Rahul Mahajan on 11/07/2020.
//  Copyright © 2020 Rahul Mahajan. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    open override var childForStatusBarHidden: UIViewController? {
        return self.topViewController
    }

    open override var childForStatusBarStyle: UIViewController? {
        return self.topViewController
    }
}
