//
//  ViewController.swift
//  HotelBookingApp
//
//  Created by AcePlus Admin on 9/2/19.
//  Copyright © 2019 SLH. All rights reserved.
//

import UIKit
import FittedSheets

class SearchViewController: UIViewController {
	
	@IBOutlet weak var tfCount : UITextField!
	@IBOutlet weak var tfRooms : UITextField!
	@IBOutlet weak var tfLocation : UITextField!
	@IBOutlet weak var tfCheckInDate : UITextField!
	@IBOutlet weak var tfCheckOutDate : UITextField!
	
	@IBOutlet weak var filterView : UIView!
	@IBOutlet weak var viewExplore: UIView!
	@IBOutlet weak var viewLocation: UIView!
	@IBOutlet weak var tableViewExplore: UITableView!
	
	var datePicker : UIDatePicker!
	var activeTextField : UITextField?
	var mDataList : [String:[HotelVO]] = HotelVO.getHotelsBySearchGroup()
	var titles : [String] {
		return mDataList.keys.sorted{$0>$1}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		configureTableView()
		configureDatePicker()
		configureTapGestureRecognizer()
		
	}
	func configureTableView() {
		tableViewExplore.delegate = self
		tableViewExplore.dataSource = self
		tableViewExplore.registerForCell(StrID: String(describing: OuterTableViewCell.self))
		tableViewExplore.registerForCell(StrID: String(describing: SectionHeaderTableViewCell.self))
	}
	func configureDatePicker(){
		datePicker = UIDatePicker()
		datePicker?.datePickerMode = .date
		datePicker?.addTarget(self, action: #selector(self.selectDate(_ :)), for: .valueChanged)
		tfCheckOutDate.delegate = self
		tfCheckInDate.delegate = self
		
		tfCheckInDate.inputView = datePicker
		tfCheckOutDate.inputView = datePicker

	}
	
	func configureTapGestureRecognizer(){
		let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleFilterTap))
		filterView.addGestureRecognizer(gestureRecognizer)
		let locationTapGesture = UITapGestureRecognizer(target: self, action: #selector(showLocationView(sender:)))
		viewLocation.addGestureRecognizer(locationTapGesture)
		let dismissTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleDismissKeyboard))
		viewExplore.addGestureRecognizer(dismissTapGesture)
		
	}
	
	@objc func handleDismissKeyboard() {
		self.view.endEditing(true)
	}
	
	@objc func selectDate(_ datePicker:UIDatePicker){
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "dd,MMM yyyy"
		activeTextField?.text = dateFormatter.string(from: datePicker.date)
		view.endEditing(true)
	}
	
	@objc func handleFilterTap(){
		let storyBoard = UIStoryboard(name: "Filter", bundle: nil)
		let controller = storyBoard.instantiateViewController(withIdentifier: String(describing:FilterViewController.self))
		let sheetController = SheetViewController(controller: controller,sizes: [.fixed(600),.halfScreen,.fullScreen])
		sheetController.topCornersRadius = 15
		sheetController.dismissOnBackgroundTap = false
		sheetController.extendBackgroundBehindHandle = true
		sheetController.overlayColor = UIColor.gray.withAlphaComponent(0.5)
		self.present(sheetController, animated: false, completion: nil)
	}
	
	@objc func showLocationView(sender:UITapGestureRecognizer){
		
		// Mark : - Future implementation
		print("Show Location list view")
	}
	
}

extension SearchViewController : UITextFieldDelegate{
	
	func textFieldDidBeginEditing(_ textField: UITextField) {
		activeTextField = textField
	}
}

extension SearchViewController : UITableViewDataSource {
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return titles.count
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: OuterTableViewCell.self), for: indexPath) as! OuterTableViewCell
		let key = titles[indexPath.section]
		cell.mHotelList = mDataList[key]
		return cell
	}
}

extension SearchViewController : UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SectionHeaderTableViewCell.self)) as? SectionHeaderTableViewCell{
			cell.labelTitle.text = titles[section]
			return cell.contentView
		}else {
			return UIView()
		}
	}
	
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SectionHeaderTableViewCell.self)) as? SectionHeaderTableViewCell
		return cell?.frame.height ?? 0
	}
}

