//
//  PlacesTableViewCell.swift
//  HotelBookingApp
//
//  Created by AcePlus Admin on 9/2/19.
//  Copyright © 2019 SLH. All rights reserved.
//

import UIKit
import SDWebImage

class HotelTableViewCell: UITableViewCell {
	var isBookMark : Bool = false

	@IBOutlet weak var imageViewHotel: UIImageView!
	
	@IBOutlet weak var labelRating: UILabel!
	
	@IBOutlet weak var labelPrice: UILabel!
	
	@IBOutlet weak var labelPromotion: UILabel!
	
	@IBOutlet weak var labelName: UILabel!
	
	@IBOutlet weak var labelAddress: UILabel!
	
	@IBOutlet weak var labelFactility1: UILabel!
	
	@IBOutlet weak var labelFactility2: UILabel!
	
	var mData : HotelVO! {
		didSet {
			labelName.text = mData.name
			labelPrice.text = "\(mData.price)$/Day"
			labelPromotion.text = mData.promotionText
			labelAddress.text = mData.address
			labelRating.text = "\(mData.rating) (\(mData.rationgCount) Ratings)"
			labelFactility1.text = mData.amenities[0]
			labelFactility2.text = mData.amenities[1]
			imageViewHotel.sd_setImage(with: URL(string: mData.imageURL), completed: nil)

		}
	}
	
	override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
		imageViewHotel.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
	
	@IBAction func btnBookmark(_ sender: UIButton)
	{
		isBookMark = !isBookMark
		if isBookMark {
			sender.tintColor = #colorLiteral(red: 0.5843137255, green: 0.1254901961, blue: 0.9882352941, alpha: 1)
			sender.setImage(#imageLiteral(resourceName: "icons8-bookmark_ribbon"), for: .normal)
		}else {
			sender.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
			sender.setImage(#imageLiteral(resourceName: "bookmark_ribbon-line"), for: .normal)
		}
	}
}
