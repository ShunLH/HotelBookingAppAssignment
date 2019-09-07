//
//  HomeViewController.swift
//  HotelBookingApp
//
//  Created by AcePlus Admin on 9/2/19.
//  Copyright © 2019 SLH. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
	

	@IBOutlet weak var btnLocation: UIButton!
	@IBOutlet weak var profileImageView: UIImageView!
	@IBOutlet weak var tableViewHotels: UITableView!
	
	@IBOutlet weak var pickerView: UIPickerView!
	var mHotelList : [HotelVO] = HotelVO.getNearbyHotels()
	var locationList = ["Dhaka ","Calafonia ","Seoul ","Myanmar ","Tokyo "]
    override func viewDidLoad() {
        super.viewDidLoad()
		
		tableViewHotels.delegate = self
		tableViewHotels.dataSource = self
		tableViewHotels.registerForCell(StrID: String(describing: HotelTableViewCell.self))
		tableViewHotels.registerForCell(StrID: String(describing: CustomSectionTableViewCell.self))
		
		btnLocation.imageView?.contentMode = .scaleAspectFit
		btnLocation.imageEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 0)

		profileImageView.layer.cornerRadius = 40
		
		pickerView.delegate = self
		pickerView.dataSource = self
		pickerView.isHidden = true
		pickerView.layer.cornerRadius = 10
		pickerView.backgroundColor = UIColor.white

    }
    
	@IBAction func pickLocation(_ sender: Any) {
		pickerView.isHidden = false
	}
}
extension HomeViewController : UIPickerViewDelegate {
	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		let title = locationList[row]
		btnLocation.setTitle(title, for: .normal)
		btnLocation.setNeedsLayout()
		pickerView.isHidden = true
	}
	
	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		return locationList[row]
	}
	
}
extension HomeViewController : UIPickerViewDataSource {
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 1
	}
	
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return locationList.count
	}
}

extension HomeViewController : UITableViewDataSource {
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return  mHotelList.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HotelTableViewCell.self), for: indexPath) as? HotelTableViewCell {
			cell.mData = mHotelList[indexPath.row]
			return cell
		}else {
			return UITableViewCell()
		}
	}
	
}

extension HomeViewController : SectionHeaderDelegate {
	func showHotelByType(tag: Int) {
		switch(tag){
		case 0 :
			mHotelList = HotelVO.getNearbyHotels()
			break
		case 1 :
			mHotelList = HotelVO.getPopularHotels()
			break
		case 2 :
			mHotelList = HotelVO.getNearbyHotels() + HotelVO.getPopularHotels()
			break
		default:
			print("default")
			break
		}
		tableViewHotels.reloadData()
	}
	
	
}

extension HomeViewController : UITableViewDelegate{
	
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CustomSectionTableViewCell.self)) as! CustomSectionTableViewCell
		cell.delegate = self
		return cell
		
	}
	
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CustomSectionTableViewCell.self)) as? CustomSectionTableViewCell
		return cell?.frame.height ?? 0
	}
}
