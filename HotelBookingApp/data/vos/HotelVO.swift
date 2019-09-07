//
//  PlacesVO.swift
//  HotelBookingApp
//
//  Created by AcePlus Admin on 9/2/19.
//  Copyright © 2019 SLH. All rights reserved.
//

import Foundation

class HotelVO {
	var name : String = ""
	var address : String = ""
	var imageURL : String = ""
	var promotionText : String = ""
	var amenities : [String] = [String]()
	var price : Int = 0
	var rating : Double = 0.0
	var rationgCount : Int = 0
	
	init(name:String,address:String,imageURL:String,promotionText:String,amenities:[String],price:Int,rating:Double,ratingCount:Int) {
		self.name = name
		self.address = address
		self.imageURL = imageURL
		self.promotionText = promotionText
		self.amenities = amenities
		self.price = price
		self.rating = rating
		self.rationgCount = ratingCount
	}
	
}

extension HotelVO {
	static func getNearbyHotels() -> [HotelVO] {
		return [.init(name: "The Westen", address: "Gulshan Circle2, Dhaka", imageURL: "https://www.beautiful-places.com/components/com_hotproperty/img/std/860_0526_BP_Bristol_062917.jpg", promotionText: "GET 50% OFF", amenities: ["Free Wifi","Swimming"], price: 99, rating: 4.5, ratingCount: 21),
			.init(name: "Lavender Sky", address: "Gulshan Circle2, Dhaka", imageURL: "https://www.beautiful-places.com/components/com_hotproperty/img/std/922_BeautifulPlaces_LavenderSky_388.jpg", promotionText: "FREE BUFFET DINNER", amenities: ["Free Wifi","Swimming"], price: 89, rating: 4.3, ratingCount: 20),
			.init(name: "Sebastiani", address: "Airport Road, Dhaka", imageURL: "https://www.beautiful-places.com/components/com_hotproperty/img/std/121_Sebastiani_032.jpg", promotionText: "GET 50% OFF", amenities: ["Free Wifi","Swimming"], price: 79, rating: 4.1, ratingCount: 18),
			.init(name: "VillaSavino", address: "VillaSavino, Dhaka", imageURL: "https://www.beautiful-places.com/components/com_hotproperty/img/std/663_BeautifulPlaces_VillaSavino_057.jpg", promotionText: "FREE BUFFET DINNER", amenities: ["Free Wifi","Swimming"], price: 99, rating: 4.5, ratingCount: 24)
		]
	}
	
	static func getPopularHotels() -> [HotelVO] {
		return [
			.init(name: "AMITA HOTEL", address: "Kalaw", imageURL: "https://cdn.owaytrip.com/extranet/hotels/15464990455.jpg", promotionText: "GET 50% OFF", amenities: ["Free Wifi","Swimming"], price: 99, rating: 4.5, ratingCount: 21),
			.init(name: "Sebastiani", address: "Airport Road, Dhaka", imageURL: "https://www.beautiful-places.com/components/com_hotproperty/img/std/121_Sebastiani_032.jpg", promotionText: "GET 50% OFF", amenities: ["Free Wifi","Swimming"], price: 79, rating: 4.1, ratingCount: 20),
				.init(name: "Lavender Sky", address: "Gulshan Circle2, Dhaka", imageURL: "https://www.beautiful-places.com/components/com_hotproperty/img/std/922_BeautifulPlaces_LavenderSky_388.jpg", promotionText: "FREE BUFFET DINNER", amenities: ["Free Wifi","Swimming"], price: 89, rating: 4.3, ratingCount: 19),
				.init(name: "The Beauty Sky", address: "Gulshan Circle2, Dhaka", imageURL: "https://www.beautiful-places.com/components/com_hotproperty/img/std/922_BeautifulPlaces_LavenderSky_427.jpg", promotionText: "GET 50% OFF", amenities: ["Free Wifi","Swimming"], price: 99, rating: 4.5, ratingCount: 24)
		]
	}
	
	static func getHotelsBySearchGroup() -> [String:[HotelVO]]{
		return[
			"TOP SEARCHES":[.init(name: "HOTEL DE LUNA", address: "Seoul , Korea", imageURL: "https://koreandramaland.com/wp-content/uploads/2019/07/hotel-del-luna-2019-filming-location-episode-1-mokpo-modern-history-museum-koreandramaland-3-1280x800.jpg", promotionText: "GET 50% OFF", amenities: ["Free Wifi","Top Bar"], price: 99, rating: 4.5, ratingCount: 21),
				.init(name: "LAVENDER SKY", address: "Gulshan Circle2, Dhaka", imageURL: "https://www.beautiful-places.com/components/com_hotproperty/img/std/922_BeautifulPlaces_LavenderSky_427.jpg", promotionText: "GET 50% OFF", amenities: ["Free Wifi","Swimming"], price: 99, rating: 4.5, ratingCount: 21),
				.init(name: "AMITA HOTEL", address: "Kalaw", imageURL: "https://cdn.owaytrip.com/extranet/hotels/15464990455.jpg", promotionText: "GET 50% OFF", amenities: ["Free Wifi","Swimming"], price: 99, rating: 4.5, ratingCount: 21),.init(name: "BP BRISTO", address: "Calafonia", imageURL: "https://www.beautiful-places.com/components/com_hotproperty/img/std/860_0526_BP_Bristol_062917.jpg", promotionText: "GET 50% OFF", amenities: ["Free Wifi","Swimming"], price: 99, rating: 4.5, ratingCount: 21),.init(name: "LOMITIA EXTERIORS", address: "Seoul, Korea", imageURL: "https://www.beautiful-places.com/components/com_hotproperty/img/std/595_BP_Lomita_Exteriors_038.jpg", promotionText: "GET 20% OFF", amenities: ["Breakfast","Free Wifi"], price: 199, rating: 3.5, ratingCount: 21)],
			"RECENT SEARCHES":[.init(name: "HOTEL BLUE MOON", address: "Seoul, Korea", imageURL: "https://www.beautiful-places.com/components/com_hotproperty/img/std/922_BeautifulPlaces_LavenderSky-915.jpg", promotionText: "GET 20% OFF", amenities: ["Breakfast","Free Wifi"], price: 79, rating: 3.5, ratingCount: 15),
			.init(name: "LOMITIA EXTERIORS", address: "Seoul, Korea", imageURL: "https://www.beautiful-places.com/components/com_hotproperty/img/std/595_BP_Lomita_Exteriors_038.jpg", promotionText: "GET 20% OFF", amenities: ["Breakfast","Free Wifi"], price: 199, rating: 3.5, ratingCount: 21),
			.init(name: "LAVENDER SKY", address: "Gulshan Circle2, Dhaka", imageURL: "https://www.beautiful-places.com/components/com_hotproperty/img/std/922_BeautifulPlaces_LavenderSky_427.jpg", promotionText: "GET 50% OFF", amenities: ["Free Wifi","Swimming"], price: 99, rating: 4.5, ratingCount: 18)]
			
		]
	}
}
