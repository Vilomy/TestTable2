//
//  APIManager.swift
//  TestTable2
//
//  Created by user05 on 09.03.2023.
//

import Foundation

class APIManager {
	static let shared = APIManager()
	
	let urlString = "https://jsonplaceholder.typicode.com/photos/"
	
	func getData() {
		let url = URL(string: urlString)!
		let request = URLRequest(url: url)
		let task = URLSession.shared.dataTask(with: request) { data, response, error in
			print(response)
		}
		task.resume()
	}
}

