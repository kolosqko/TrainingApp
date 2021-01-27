//
//  SecondScreenViewController.swift
//  TrainingApp
//
//  Created by Kostyantyn Koloskov on 27.01.2021.
//

import UIKit

class SecondScreenViewController: UIViewController, StoryboardInstantiable {
    var viewModel: SecondScreenViewModelProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Second screen"
    }
}
