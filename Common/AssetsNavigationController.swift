//
//  AssetsNavigationController.swift
//  AssetsPickerViewController
//
//  Created by Alexander Polovinka on 2/28/19.
//

import Foundation
import UIKit

open class AssetsNavigationController : UINavigationController {

    override open var preferredStatusBarStyle: UIStatusBarStyle {
        return AssetsPickerConfig.statusBarStyle
    }

}
