//
//  TextFieldContainerView.swift
//  MessageSender
//
//  Created by Kacper on 10.01.2015.
//  Copyright (c) 2015 Kacper. All rights reserved.
//

import UIKit

class TextFieldContainerView: UIView {
    override init(frame: CGRect) {
        fatalError("init(frame:) has not been implemented")
        
    }
    
    override func drawRect(rect: CGRect) {
        let bezierPath = UIBezierPath()
        var startPoint = CGPointMake(0, self.frame.size.height/2)
        //        var startPoint = CGPointMake(textFieldsContainerView.frame.origin.x, textFieldsContainerView.frame.origin.y + textFieldsContainerView.frame.size.height/2)
        //        var endPoint = startPoint
        var endPoint = CGPointMake(self.frame.size.width, self.frame.size.height/2)
        bezierPath.moveToPoint(startPoint)
        bezierPath.addLineToPoint(endPoint)
        bezierPath.lineWidth = 0.3
        UIColor(red: 151/255.0, green: 151/255.0, blue: 151/255.0, alpha: 1.0).setFill()
        bezierPath.stroke()

        
    }


    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.borderColor = UIColor(red: 151/255.0, green: 151/255.0, blue: 151/255.0, alpha: 1.0).CGColor
        self.layer.borderWidth = 1.0;
        self.layer.cornerRadius = 3.0;
            }
    
    
}
