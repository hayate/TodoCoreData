//
//  TaskViewCell.swift
//  TodoCoreData
//
//  Created by Andrea Belvedere on 2021/03/02.
//

import UIKit

class TaskViewCell: UITableViewCell {
    public static let Idendifier: String = "TaskViewCell"

    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!

    private let doneImage = UIImage(systemName: "circle.fill")?.withTintColor(.systemGray, renderingMode: .alwaysOriginal)
    private let todoImage = UIImage(systemName: "circle")?.withTintColor(.systemGray, renderingMode: .alwaysOriginal)


    private var task: Task! {
        didSet {
            taskLabel.text = task.task
            self.setupDoneButton()
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    public func setTask(_ task: Task) -> Void {
        self.task = task
    }

    private func setupUI() -> Void {
        selectionStyle = .none

        doneButton.setTitle("", for: .normal)
    }

    @IBAction func onDoneButtonTap(_ sender: Any) {
        task.done.toggle()
        
        self.setupDoneButton()
    }

    private func setupDoneButton() -> Void {
        if task.done {
            self.doneButton.setImage(doneImage, for: .normal)
        } else {
            self.doneButton.setImage(todoImage, for: .normal)
        }
    }

}
