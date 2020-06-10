//
//  UIComponents.swift
//  Demo
//
//  Created by Farhan Mirza on 06/06/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import UIKit

// UIComponents class that provide views

class UIComponents {
    static let shared = UIComponents()
    private init() {
       // avoid instances
    }
    
    // MARK: UILabel
    func label(text : String, alignment: NSTextAlignment = .left, fontName : String = FontName.Regular, fontSize : CGFloat = 14, color : UIColor = AppTheme.textColor) -> UILabel {
        let label = UILabel()
        label.font = UIFont(name: fontName, size: fontSize)
        label.text = text
        label.textColor = color
        label.textAlignment = alignment
        label.numberOfLines = 0
        return label
    }
    
    // MARK: UIView
    func container(bgColor : UIColor = .white, cornerRadius : CGFloat = 0) -> UIView {
        let view = UIView()
        view.backgroundColor = bgColor
        view.layer.cornerRadius = cornerRadius
        return view
    }
    
   // MARK: UIImageView
    func ImageView(imageName : String = "", contentMode : UIView.ContentMode = .scaleAspectFill, cornerRadius : CGFloat = 0) -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = contentMode
        imageView.image = UIImage(named: imageName)
        imageView.layer.cornerRadius  = cornerRadius
        imageView.clipsToBounds = true
        return imageView
    }
    
    // MARK: UITableView
    func tableView() -> UITableView {
        let tableView = UITableView()
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        return tableView
    }
}

