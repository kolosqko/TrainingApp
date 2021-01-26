//
//  ScreenCoordinator.swift
//  TrainingApp
//
//  Created by Kostyantyn Koloskov on 26.01.2021.
//

import Foundation
import UIKit

class ScreenCoordinator: Coordinator {

    let presenter: UINavigationController
    var screenViewController: UIViewController?

    init(presenter: UINavigationController) {
        self.presenter = presenter
    }

    func start() {
        let screenViewController: ScreenViewController = ScreenViewController.instantiateViewController()
        presenter.pushViewController(screenViewController, animated: true)
        self.screenViewController = screenViewController
    }
}
