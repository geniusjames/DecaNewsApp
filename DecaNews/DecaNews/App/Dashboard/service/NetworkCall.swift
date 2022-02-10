//
//  NetworkCall.swift
//  DecaNews
//
//  Created by mac on 09/02/2022.
//

//
//  Network.swift
//  Currency Converter
//
//  Created by mac on 28/01/2022.
//

import UIKit
import Alamofire
import SwiftyJSON

typealias SuccessBlock = ((Empty) -> Void)?
typealias ErrorBlock = ((String) -> Void)?

class NetworkManager {
	
	static var shared = NetworkManager()
	
	var successResponse: SuccessBlock!
	var errorResponse: ErrorBlock!
	
	init() {
		
	}
	
	func networkRequest(url: String, successCompletion: SuccessBlock, errorCompletion: ErrorBlock) {

		guard let urlMain = URL(string: url) else {
			return
		}
		URLSession.shared.dataTask(with: urlMain) { data, _, error in
			if let error = error {
				errorCompletion?(error.localizedDescription)
			}
			if let data = data {
				do {
					let response = try JSONDecoder().decode(Empty.self, from: data)
					successCompletion?(response)
				} catch let error {
					print("ERROR FROM DECODING: ", error.localizedDescription)
//					errorCompletion?(error.localizedDescription)
				}
			}
		}.resume()
	}
	
	func getImageDataFrom(url: URL, imageCell: UIImageView){
		URLSession.shared.dataTask(with: url) {(data, response, error) in
			 if let error = error {
				print("error is: \(error.localizedDescription)")
				return
			}
			  guard let data = data else {
				print("no data found")
				return
			}
			 DispatchQueue.main.async {
				if let img = UIImage(data: data) {
					imageCell.image = img
				}
			}
		}.resume()
	}
	
}
