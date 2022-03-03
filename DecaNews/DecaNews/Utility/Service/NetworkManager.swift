//
//  NetworkCall.swift
//  DecaNews
//
//  Created by mac on 09/02/2022.
//

import UIKit

typealias SuccessBlock = ((Base) -> Void)?
typealias ErrorBlock = ((String) -> Void)?

protocol NetworkManagerRepository {
    func networkRequest(url: String, successCompletion: SuccessBlock, errorCompletion: ErrorBlock)
    
    func getImageDataFrom(url: URL, completionHandler: @escaping (Data) -> Void)
}

class NetworkManager: NetworkManagerRepository {
	
//	static var shared = NetworkManager()
	
	var successResponse: SuccessBlock!
	var errorResponse: ErrorBlock!
	
	init() { }
	
    public func networkRequest(url: String, successCompletion: SuccessBlock, errorCompletion: ErrorBlock) {

            guard let urlMain = URL(string: url) else {
                return
            }
            URLSession.shared.dataTask(with: urlMain) { data, _, error in
			if let error = error {
				errorCompletion?(error.localizedDescription)
			}
			if let data = data {
				do {
					let response = try JSONDecoder().decode(Base.self, from: data)
					successCompletion?(response)
				} catch let error {
					print("ERROR FROM DECODING: ", error.localizedDescription)
					errorCompletion?(error.localizedDescription)
				}
			}
		}.resume()
	}
	
    public func getImageDataFrom(url: URL, completionHandler: @escaping (Data) -> Void) {
		URLSession.shared.dataTask(with: url) {(data, _, error) in
			 if error == nil {
				return
			}
			  guard let data = data else {
				return
			}
			 DispatchQueue.main.async {
//				if let img = UIImage(data: data) {
//					imageCell.image = img
//				}
                 completionHandler(data)
			}
		}.resume()
	}
	
}
