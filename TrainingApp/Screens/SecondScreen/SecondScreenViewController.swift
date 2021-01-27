//
//  SecondScreenViewController.swift
//  TrainingApp
//
//  Created by Kostyantyn Koloskov on 27.01.2021.
//

import UIKit
import ReactiveCocoa
import ReactiveSwift

class SecondScreenViewController: UIViewController, StoryboardInstantiable {
    var viewModel: SecondScreenViewModelProtocol?

    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    private var textFieldCount: Int = 0 {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Second screen"
        tableView.dataSource = self
        registerTableViewCells()
        // reactive staff
        let textSignal = textField.reactive.continuousTextValues
        outputLabel.reactive.text <~ textSignal
        let observer = Signal<String, Never>.Observer { [weak self] event in
            switch event {
            case .value(let text):
                self?.textFieldCount = text.count
            default:
                print(event.description)
            }
        }
        textSignal.observe(observer)
    }

    private func registerTableViewCells() {
        let secondScreenNibName = "SecondScreenTableViewCell"
        let secondScreenTableViewCellNib = UINib(nibName: secondScreenNibName, bundle: nil)
        tableView.register(secondScreenTableViewCellNib, forCellReuseIdentifier: secondScreenNibName)
    }
}

extension SecondScreenViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textFieldCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SecondScreenTableViewCell", for: indexPath)
        cell.backgroundColor = indexPath.row % 2 == 1 ? UIColor.red : UIColor.blue
        return cell
    }
}
