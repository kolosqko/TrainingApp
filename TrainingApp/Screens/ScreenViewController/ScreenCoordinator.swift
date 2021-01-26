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
    var rxSwiftCoordinator: RxSwiftCoordinator?

    init(presenter: UINavigationController) {
        self.presenter = presenter
    }

    func start() {
        let viewModel = ScreenViewModel()
        let screenViewController: ScreenViewController = ScreenViewController.instantiateViewController()
        presenter.pushViewController(screenViewController, animated: true)
        screenViewController.viewModel = viewModel
        screenViewController.delegate = self
        screenViewController.bindViewModel()
        self.screenViewController = screenViewController
    }
}

extension ScreenCoordinator: ScreenViewControllerDelegate {
    func openRxSwiftButtonPressed() {
        let rxSwiftCoordinator = RxSwiftCoordinator(presenter: presenter)
        rxSwiftCoordinator.start()
        self.rxSwiftCoordinator = rxSwiftCoordinator
    }
}
