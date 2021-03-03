//
//  ViewController.swift
//  TodoCoreData
//
//  Created by Andrea Belvedere on 2021/03/02.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    private let tasks: Tasks = Tasks.getInstance()
    private let plusImage = UIImage(systemName: "plus")?.withTintColor(.label, renderingMode: .alwaysOriginal)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        setupUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if tableView.numberOfRows(inSection: 0) < self.tasks.count() {
            tableView.reloadData()
        }
    }

    private func setupUI() -> Void {
        title = "Todo"
        tableView.dataSource = self

        navigationItem.rightBarButtonItem = UIBarButtonItem(image: plusImage, style: .plain, target: self, action: #selector(onPlusButtonTap(_:)))
    }

    @objc private func onPlusButtonTap(_ sender: UIBarButtonItem) -> Void {
        performSegue(withIdentifier: "toAddController", sender: self)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasks.count()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TaskViewCell.Idendifier, for: indexPath) as! TaskViewCell
        cell.setTask(tasks.getTask(indexPath.item))
        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tasks.remoteTask(indexPath.item)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
    }
}
