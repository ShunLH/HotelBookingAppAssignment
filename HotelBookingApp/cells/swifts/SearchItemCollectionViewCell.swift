//
//  SearchItemCollectionViewCell.swift
//  HotelBookingApp
//
//  Created by AcePlus Admin on 9/2/19.
//  Copyright © 2019 SLH. All rights reserved.
//

import UIKit
import SDWebImage

class SearchItemCollectionViewCell: UICollectionViewCell {

	@IBOutlet weak var labelRating: UILabel!
	@IBOutlet weak var labelPrice: UILabel!
	@IBOutlet weak var labelAddress: UILabel!
	@IBOutlet weak var labelName: UILabel!
	@IBOutlet weak var imageViewHotel: UIImageView!
	var mData : HotelVO! {
		didSet {
			labelName.text = mData.name
			labelAddress.text = mData.address
			imageViewHotel.sd_setImage(with: URL(string: mData.imageURL), completed: nil)
			labelRating.text = "\(mData.rating) ( \(mData.rationgCount) Ratings)"
			labelPrice.text = "\(mData.price)$/Day"
		}
	}
	override func awakeFromNib() {
        super.awakeFromNib()
		imageViewHotel.layer.cornerRadius = 8
    }

}
