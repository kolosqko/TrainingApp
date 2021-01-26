//
//  ScreenViewController.swift
//  TrainingApp
//
//  Created by Kostyantyn Koloskov on 26.01.2021.
//

import UIKit

enum LabelState {
    case noButtonPushed
    case firstButtonPushed
    case secondButtonPushed

    var labelText: String {
        switch self {
        case .noButtonPushed:
            return "No button was pushed."
        case .firstButtonPushed:
            return "First button was pushed."
        case .secondButtonPushed:
            return "Second button was pushed."
        }
    }
}

protocol ScreenDataProtocol {
    var labelState: LabelState { get set }
}

class ScreenViewController: UIViewController, StoryboardInstantiable {

    @IBOutlet weak var outputLabel: UILabel!

    @IBAction func firstButtonAction(_ sender: Any) {
        viewModel?.inputs.firstButtonPressed()
    }
    @IBAction func secondButtonAction(_ sender: Any) {
        viewModel?.inputs.secondButtonPressed()
    }

    var viewModel: ScreenViewModelProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.inputs.viewDidLoad()
    }
//  viewModel?.outputs.reloadData = reloadData(data: ScreenDataProtocol) would that create a reference cycle?????
    func bindViewModel() {
        viewModel?.outputs.reloadData = { [weak self] data in
            self?.reloadData(data: data)
        }
    }

    func reloadData(data: ScreenDataProtocol) {
        self.outputLabel.text = data.labelState.labelText
    }
}
