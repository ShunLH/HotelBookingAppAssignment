//
//  DropDownButton.swift
//  HotelBookingApp
//
//  Created by AcePlus Admin on 9/4/19.
//  Copyright © 2019 SLH. All rights reserved.
//

import Foundation


import UIKit

@IBDesignable

class CustomButtonView : UIView {
	@IBInspectable var cornerRadius : CGFloat = 2
	@IBInspectable var borderWidth : CGFloat = 1
	@IBInspectable var bordercolor : UIColor = UIColor.darkGray
	@IBInspectable var icon : UIImage = UIImage()
	@IBInspectable var title : String = "Label"
	@IBInspectable var text : String = ""
	override func awakeFromNib() {
		super.awakeFromNib()
		print("awakeFromNib")

	}
	override func layoutSubviews() {
		print("layout subview")
		layer.cornerRadius = cornerRadius
		layer.borderWidth = borderWidth
		layer.borderColor = bordercolor.cgColor
		let label = UILabel()
		label.text = title
		label.sizeToFit()
		label.frame = CGRect(x: 8, y: (frame.height-label.frame.height)/2, width: label.frame.width, height: label.frame.height)

		addSubview(label)
		let label2 = UILabel()
		label2.text = text
		label2.sizeToFit()
		label2.frame = CGRect(x: (frame.width-label2.frame.width)/2, y: (frame.height-label2.frame.height)/2, width: label2.frame.width, height: label2.frame.height)

		addSubview(label2)
		let imageView = UIImageView(frame: CGRect(x: frame.width-25, y: (frame.height-15)/2, width: 15, height: 15))
		imageView.image = icon
		addSubview(imageView)
	}
}
