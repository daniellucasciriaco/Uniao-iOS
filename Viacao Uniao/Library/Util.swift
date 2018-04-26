//
//  Util.swift
//  Viacao Uniao
//
//  Created by Daniel on 12/03/17.
//  Copyright © 2017 DLCA Solutions. All rights reserved.
//

import Foundation
import UIKit

public class Util
{
    
    public static let sharedInstance = Util()
    
    // MARK: Method(s)
    
    func getBarButtonItem(target: UIViewController, image: String, method: String, size: CGRect) -> UIBarButtonItem
    {
        let image: UIImage = UIImage(named: image)!
        let button: UIButton = UIButton(type: .custom)
        button.setBackgroundImage(image, for: .normal)
        button.addTarget(target, action: Selector(method), for: UIControlEvents.touchUpInside)
        button.frame = size
        
        let item: UIBarButtonItem = UIBarButtonItem(customView: button)
        
        return item
    }
    
    func setTitle(title:String) -> UIView
    {
        //Create a label programmatically and give it its property's
        let titleLabel = UILabel(frame: CGRect(x:0, y:8, width:0, height:0))
        titleLabel.backgroundColor = UIColor.clear
        titleLabel.textColor = UIColor.init(red: 49/255, green: 74/255, blue: 151/255, alpha: 1)
        titleLabel.font = UIFont.init(name: "Arial Rounded MT Bold", size: 17)
        titleLabel.text = title
        titleLabel.sizeToFit()
        
        // Create a view and add titleLabel and subtitleLabel as subviews setting
        let titleView = UIView(frame: CGRect(x:0, y:0, width: titleLabel.frame.size.width, height:30))
        
        // Center title on screen
        var adjustment = titleLabel.frame
        adjustment.origin.x = titleView.frame.origin.x + (titleView.frame.width/2)
        
        titleView.addSubview(titleLabel)
        
        return titleView
    }
    
}
