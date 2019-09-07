//
//  CustomSectionTableViewCell.swift
//  HotelBookingApp
//
//  Created by AcePlus Admin on 9/2/19.
//  Copyright © 2019 SLH. All rights reserved.
//

import UIKit

protocol SectionHeaderDelegate {
	func showHotelByType(tag:Int)
}

class CustomSectionTableViewCell: UITableViewCell {

	@IBOutlet weak var btnPopular: UIButton!
	@IBOutlet weak var btnAll: UIButton!
	@IBOutlet weak var btnNearBy: UIButton!
	var delegate : SectionHeaderDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
		
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
	@IBAction func btnSegment(_ sender: UIButton) {
		sender.setTitleColor(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), for: .normal)
		delegate?.showHotelByType(tag: sender.tag)

	}
}
