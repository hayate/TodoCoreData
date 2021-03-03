//
//  AddController.swift
//  TodoCoreData
//
//  Created by Andrea Belvedere on 2021/03/02.
//

import UIKit

class AddController: UIViewController {

    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!

    private let tasks: Tasks = Tasks.getInstance()


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func onAddButtonTap(_ sender: Any) {
        guard let content = taskTextField.text, !content.isEmpty else {return}

        tasks.addTask(content)

        if let nv = navigationController {
            nv.popViewController(animated: true)
        }
    }

    private func setupUI() -> Void {
        title = "Add Task"
        taskTextField.placeholder = "Enter new task"
        taskTextField.becomeFirstResponder()

        addButton.setTitle("Add Task", for: .normal)
        addButton.backgroundColor = .label
        addButton.tintColor = .systemGray6
        addButton.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        addButton.layer.cornerRadius = 10
        addButton.sizeToFit()
    }
}
