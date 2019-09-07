//
//  FilterViewController.swift
//  HotelBookingApp
//
//  Created by AcePlus Admin on 9/4/19.
//  Copyright © 2019 SLH. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {

	@IBOutlet weak var sortByFilterView: CustomButtonView!
	@IBOutlet weak var btnNone: UIButton!
	
	@IBOutlet weak var btn1Star: UIButton!
	
	@IBOutlet weak var btn2Star: UIButton!

	@IBOutlet weak var btn3Star: UIButton!
	
	@IBOutlet weak var btn4Star: UIButton!
	
	@IBOutlet weak var btn5Star: UIButton!
	
	@IBOutlet weak var slider: UISlider!
	
	var btnPreviousRated : UIButton?
	
	override func viewDidLoad() {
        super.viewDidLoad()
		let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleSortByFilter))
		sortByFilterView.addGestureRecognizer(tapGesture)
		configureRatingBtn()
    }
	
	func configureRatingBtn(){
		let borderColor =  UIColor(named: "lightGrayColor") ?? UIColor.lightGray
		btnNone.setRatingButtonDesign(cornerRadius: 5, borderColor:borderColor)
		btn1Star.setRatingButtonDesign(cornerRadius: 5, borderColor: borderColor)
		btn2Star.setRatingButtonDesign(cornerRadius: 5, borderColor: borderColor)
		btn3Star.setRatingButtonDesign(cornerRadius: 5, borderColor: borderColor)
		btn4Star.setRatingButtonDesign(cornerRadius: 5, borderColor: borderColor)
		btn5Star.setRatingButtonDesign(cornerRadius: 5, borderColor: borderColor)
		btnPreviousRated = btnNone
	}
	@IBAction func btnRating(_ sender: UIButton) {
		btnPreviousRated?.backgroundColor = UIColor.white
		btnPreviousRated?.tintColor = UIColor(named: "lightGrayColor")
		btnPreviousRated?.setTitleColor(UIColor(named: "lightGrayColor"), for: .normal)
		sender.backgroundColor = #colorLiteral(red: 0.5843137255, green: 0.1254901961, blue: 0.9882352941, alpha: 1)
		sender.tintColor = UIColor.white
		sender.setTitleColor(UIColor.white, for: .normal)
		btnPreviousRated = sender
	}
	
	@IBAction func btnCancel(_ sender: Any) {
		self.dismiss(animated: true, completion: nil)
	}
	
	
	@IBAction func btnReset(_ sender: Any) {
		btnRating(btnNone)
		slider.value = 250
		sortByFilterView.text = "$$ > $$$"
	}
	
	@IBAction func btnFilter(_ sender: Any) {
		//call filter function
		self.dismiss(animated: true, completion: nil)
		
	}
	@objc func handleSortByFilter(){
		// Mark : - Future Implementation
		
		print("Click Sort By Filter View")
		
	}
}

