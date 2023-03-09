//
//  ViewController.swift
//  TestTable2
//
//  Created by user05 on 09.03.2023.
//

import UIKit

class ViewController: UIViewController {

	private var tableView = UITableView()
	private var posts: [Post] = []
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupViews()
		
		APIManager.shared.getData { [weak self] data in
			guard let self else {return}
			self.posts = data
			DispatchQueue.main.async {
				self.tableView.reloadData()
			}
		}
	}
	
	private func setupViews() {
		view.addSubview(tableView)
		tableView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			tableView.topAnchor.constraint(equalTo: view.topAnchor),
			tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
			])
		tableView.dataSource = self
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
		
		
	}
	
}

extension ViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		posts.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		cell.textLabel?.text = posts[indexPath.row].title
		return cell
	}
}
