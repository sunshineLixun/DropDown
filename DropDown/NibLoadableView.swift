//
//  NibLoadableView.swift
//  DropDown
//
//  Created by lixun on 2016/12/24.
//  Copyright © 2016年 sunshine. All rights reserved.
//

import UIKit

protocol NibLoadableView: class {}

extension NibLoadableView where Self: UIView{
    static var nibName: String{
        return String(describing: self)
    }
}

extension UITableViewCell: NibLoadableView {}
