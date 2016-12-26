//
//  ViewController.swift
//  DropDown
//
//  Created by lixun on 2016/12/23.
//  Copyright © 2016年 sunshine. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    fileprivate  struct ImageView {
        static let ImageViewHeight: CGFloat = 240
    }

    lazy var headerImageView: UIImageView = {
        let imageView = UIImageView.init(image: UIImage.init(named: "Merry"))
        imageView.frame = CGRect.init(x: 0, y: 0, width: self.view.frame.size.width, height: ImageView.ImageViewHeight)
        return imageView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 50
        tableView.lx_register(DetailTableViewCell.self)
        
        tableView.insertSubview(headerImageView, at: 0)

        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.size.width, height: ImageView.ImageViewHeight))
        headerView.backgroundColor = UIColor.clear
        tableView.tableHeaderView = headerView
        
    }
}



extension ViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.lx_dequeueReusableCell(forIndexPath: indexPath) as DetailTableViewCell
        cell.textLabel?.text = "\(indexPath.row + 1)"
        return cell
        
    }
}


extension ViewController{
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y + scrollView.contentInset.top
        if offsetY < 0 {
            //向下拉
            headerImageView.frame = CGRect.init(x: offsetY, y: offsetY, width: scrollView.bounds.size.width - offsetY * 2, height: ImageView.ImageViewHeight - offsetY)
        }else{
            headerImageView.frame = CGRect.init(x: 0, y: 0, width: scrollView.bounds.size.width, height: ImageView.ImageViewHeight)
        }
        
    }
}
