//
//  Extensions.swift
//  Demo
//
//  Created by Farhan Mirza on 06/06/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//


import UIKit
import Kingfisher
import Segmentio

// MARK:  UIView
extension UIView {
    func addSubViews(views : UIView...) {
        views.forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            addSubview(view)
        }
    }
}
extension UIView {
    func addShadow(radius:CGFloat = 5,color:UIColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25),opacity:Float = 0.7) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
        self.layer.masksToBounds = false
    }
}

// MARK: UIViewController
extension UIViewController {
    // alert message
    func alert(message: String, title: String = "") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
}


// MARK: UIImageView
extension UIImageView {
    func loadImageWithURL(url : String) {
        let svgUrl = URL(string: url)!
        let processor = SVGProcessor(size: CGSize(width: 60, height: 60))
        KingfisherManager.shared.retrieveImage(with: svgUrl, options: [.processor(processor), .cacheOriginalImage]) {  result in
            switch (result){
            case .success(let value):
                self.image = value.image
            case .failure(let error):
                print("error", error.localizedDescription)
            }
        }
    }
}

// MARK: Segmentio
extension Segmentio {
    func configuration(items : [SegmentioItem]) {
        let segmentStates =  SegmentioStates(
            defaultState: SegmentioState(
                backgroundColor: .clear,
                titleFont: UIFont(name: FontName.Bold, size: 14)!,
                titleTextColor: .lightGray
            ),
            selectedState: SegmentioState(
                backgroundColor: .clear,
                titleFont: UIFont(name: FontName.Bold, size: 14)!,
                titleTextColor: AppTheme.textColor
            ),
            highlightedState: SegmentioState(
                backgroundColor: .clear,
                titleFont: UIFont(name: FontName.Bold, size: 14)!,
                titleTextColor: .lightGray
            )
        )
        let options = SegmentioOptions(backgroundColor: .clear, segmentPosition: .dynamic, scrollEnabled: true, indicatorOptions: SegmentioIndicatorOptions(type: .bottom, ratio: 1, height: 1, color: AppTheme.primaryColor), horizontalSeparatorOptions: SegmentioHorizontalSeparatorOptions(type: .bottom, height: 1, color: .clear
        ), verticalSeparatorOptions: SegmentioVerticalSeparatorOptions(ratio:0.7, color: AppTheme.primaryColor), imageContentMode: .scaleAspectFill, labelTextAlignment: .center, labelTextNumberOfLines: 0, segmentStates: segmentStates, animationDuration: 0.2)
        self.setup(content: items, style: .onlyLabel, options: options)
        self.selectedSegmentioIndex = 0
        
    }
}


// MARK: UIColor
extension UIColor {
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return String(format:"#%06x", rgb)
    }
}
