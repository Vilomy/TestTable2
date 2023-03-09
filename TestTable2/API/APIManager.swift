//
//  APIManager.swift
//  TestTable2
//
//  Created by user05 on 09.03.2023.
//

import UIKit

class APIManager {
	static let shared = APIManager()
	
	let urlString = "https://jsonplaceholder.typicode.com/photos/"
	
	func getData(completion: @escaping ([Post]) -> Void) {
		let url = URL(string: urlString)!
		let request = URLRequest(url: url)
		let task = URLSession.shared.dataTask(with: request) { data, _, error in
			guard let data else {return}
			do {
				
				let postData = try JSONDecoder().decode([Post].self, from: data)
				completion(postData)
			} catch {
				print("Error decoding")
				print(error.localizedDescription)
			}
			
		}
		task.resume()
	}
	
	func getImage(urlString: String, completion: @escaping(UIImage?) -> Void) {
		let url = URL(string: urlString)!
		let request = URLRequest(url: url)
		let task = URLSession.shared.dataTask(with: request) { data, _, error in
			guard let data else {return}
			
			DispatchQueue.global(qos: .background).async {
				let image = UIImage(data: data)
				completion(image)
			}
			
		}
		task.resume()
	}
}


