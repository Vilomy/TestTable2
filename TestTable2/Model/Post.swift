//
//  Post.swift
//  TestTable2
//
//  Created by user05 on 09.03.2023.
//

import Foundation

struct Post: Codable {
	let albumID, id: Int
	let title: String
	let url, thumbnailURL: String

	enum CodingKeys: String, CodingKey {
		case albumID = "albumId"
		case id, title, url
		case thumbnailURL = "thumbnailUrl"
	}
}
