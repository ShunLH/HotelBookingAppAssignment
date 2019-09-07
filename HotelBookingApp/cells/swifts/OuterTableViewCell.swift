//
//  OuterTableViewCell.swift
//  HotelBookingApp
//
//  Created by AcePlus Admin on 9/2/19.
//  Copyright © 2019 SLH. All rights reserved.
//

import UIKit

class OuterTableViewCell: UITableViewCell {

	
	
	@IBOutlet weak var collectionViewHotels: UICollectionView!
	var mHotelList : [HotelVO]?
	
	override func awakeFromNib() {
        super.awakeFromNib()
		selectionStyle = .none
		collectionViewHotels.delegate = self
		collectionViewHotels.dataSource = self
		collectionViewHotels.registerForCell(StrID: String(describing: SearchItemCollectionViewCell.self))
		var itemWidth  : CGFloat = 0
		var itemHeight : CGFloat = 200
		itemWidth = self.bounds.width - 60
		
        let layout = collectionViewHotels.collectionViewLayout as! UICollectionViewFlowLayout
		layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
		layout.minimumLineSpacing = 5
		layout.minimumInteritemSpacing = 0

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension OuterTableViewCell : UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return mHotelList?.count ?? 0
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let item = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: SearchItemCollectionViewCell.self), for: indexPath) as! SearchItemCollectionViewCell

		item.mData = mHotelList?[indexPath.row]
		return item
	}
	
	
}
extension OuterTableViewCell : UICollectionViewDelegate {
	
}
