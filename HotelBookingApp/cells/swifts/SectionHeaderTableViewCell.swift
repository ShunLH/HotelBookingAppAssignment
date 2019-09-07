//
//  SectionHeaderTableViewCell.swift
//  HotelBookingApp
//
//  Created by AcePlus Admin on 9/3/19.
//  Copyright © 2019 SLH. All rights reserved.
//

import UIKit

class SectionHeaderTableViewCell: UITableViewCell {

	@IBOutlet weak var labelTitle: UILabel!
	
	var titleStr : String! {
		didSet {
			labelTitle.text = titleStr
		}
	}
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
