//
//  DetailsViewController.swift
//  TestTable2
//
//  Created by user05 on 09.03.2023.
//

import UIKit

final class DetailsViewController: UIViewController {
	
	private var scrollView: UIScrollView = {
		let scrollView = UIScrollView()
		scrollView.bounces = false
		scrollView.translatesAutoresizingMaskIntoConstraints = false
		return scrollView
	}()
	
	private let hugeImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.image = UIImage(systemName: "star")
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleAspectFill
		return imageView
	}()
	
	private let descriptionLabel: UILabel = {
		let label = UILabel()
		label.text = "Explore more"
		label.textColor = .white
		label.font = UIFont.systemFont(ofSize: 14)
		label.numberOfLines = 0
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupViews()
		setConstraints()
	}
	
	private func setupViews() {
		view.backgroundColor = #colorLiteral(red: 0.1646832824, green: 0.1647188365, blue: 0.1646810472, alpha: 1)
		
		navigationController?.navigationBar.tintColor = .white
		
		view.addSubview(scrollView)
		scrollView.addSubview(hugeImageView)
		scrollView.addSubview(descriptionLabel)
	}
	
	private func setConstraints() {
		NSLayoutConstraint.activate([
			scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
			scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
			scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
			scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
			
			hugeImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
			hugeImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
			hugeImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
			hugeImageView.heightAnchor.constraint(equalToConstant: view.frame.width),
			
			descriptionLabel.topAnchor.constraint(equalTo: hugeImageView.bottomAnchor, constant: 16),
			descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
			descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
		])
	}
}
