//
//  Extensions.swift
//  HotelBookingApp
//
//  Created by AcePlus Admin on 9/2/19.
//  Copyright © 2019 SLH. All rights reserved.
//

import UIKit

extension UITableView {
	func registerForCell(StrID : String) {
		register(UINib(nibName: StrID, bundle: nil), forCellReuseIdentifier: StrID)
	}
}

extension UICollectionView {
	func registerForCell(StrID : String){
		register(UINib(nibName: StrID, bundle: nil), forCellWithReuseIdentifier: StrID)
	}
}
extension UIButton{
	func setRatingButtonDesign(cornerRadius:CGFloat,borderColor : UIColor){
		layer.cornerRadius = cornerRadius
		layer.borderWidth = 1
		layer.borderColor = borderColor.cgColor
		imageView?.contentMode = .scaleAspectFit
		imageEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
	}
}
