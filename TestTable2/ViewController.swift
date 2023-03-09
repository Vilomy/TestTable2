//
//  ViewController.swift
//  TestTable2
//
//  Created by user05 on 09.03.2023.
//

import UIKit

class ViewController: UIViewController {

	private var tableView = UITableView()
	
	override func viewDidLoad() {
		super.viewDidLoad()
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
		10
	}
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		cell.textLabel?.text = "\(indexPath.row)"
		return cell
	}
}
