//
//  PostTableViewCell.swift
//  TestTable2
//
//  Created by user05 on 09.03.2023.
//

import UIKit

final class PostTableViewCell: UITableViewCell {
	
	static let reuseId = "PostTableViewCell"
	
	private let weatherImageView: UIImageView = {
		let image = UIImageView()
		image.backgroundColor = .red
		image.translatesAutoresizingMaskIntoConstraints = false
		return image
	}()
	
	public let temperatureLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.systemFont(ofSize: 25)
		label.textColor = .white
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	func configure(model: Post) {
		temperatureLabel.text = model.title
		APIManager.shared.getImage(urlString: model.thumbnailURL) { [weak self] data in
			guard let self else {return}
			DispatchQueue.main.async {
				
				self.weatherImageView.image = data
			}
		}
	}
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupViews()
		setConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func setupViews() {
		addSubview(weatherImageView)
		addSubview(temperatureLabel)
	}
	
	private func setConstraints() {
		NSLayoutConstraint.activate([
			weatherImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
			weatherImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
			weatherImageView.widthAnchor.constraint(equalToConstant: 130),
			weatherImageView.heightAnchor.constraint(equalToConstant: 130),

			temperatureLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
			temperatureLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
		])
	}
}
