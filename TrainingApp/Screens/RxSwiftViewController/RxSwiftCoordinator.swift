//
//  RxSwiftCoordinator.swift
//  TrainingApp
//
//  Created by Kostyantyn Koloskov on 26.01.2021.
//

import Foundation
import UIKit

class RxSwiftCoordinator: Coordinator {
    let presenter: UINavigationController
    var rxSwiftViewController: RxSwiftViewController?
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    func start() {
        let rxSwiftViewController: RxSwiftViewController = RxSwiftViewController.instantiateViewController()
        presenter.pushViewController(rxSwiftViewController, animated: true)
        self.rxSwiftViewController = rxSwiftViewController
    }
}
