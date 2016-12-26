//
//  ReusableView.swift
//  DropDown
//
//  Created by lixun on 2016/12/24.
//  Copyright © 2016年 sunshine. All rights reserved.
//

import UIKit

protocol ReusableView: class {}

extension ReusableView where Self: UIView{
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
}

extension UITableViewCell: ReusableView {}
