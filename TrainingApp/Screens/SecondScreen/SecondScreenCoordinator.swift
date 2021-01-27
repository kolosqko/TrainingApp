//
//  SecondScreenCoordinator.swift
//  TrainingApp
//
//  Created by Kostyantyn Koloskov on 27.01.2021.
//

import Foundation
import UIKit

class SecondScreenCoordinator: Coordinator {

    let presenter: UINavigationController
    var secondScreenViewController: SecondScreenViewController?

    init(presenter: UINavigationController) {
        self.presenter = presenter
    }

    func start() {
        let secondScreenViewController: SecondScreenViewController = SecondScreenViewController.instantiateViewController()
        presenter.pushViewController(secondScreenViewController, animated: true)
        secondScreenViewController.viewModel = SecondScreenViewModel()
        self.secondScreenViewController = secondScreenViewController
    }
}
