//
//  SceneCoordinator.swift
//  TrainingApp
//
//  Created by Kostyantyn Koloskov on 26.01.2021.
//

import Foundation
import UIKit

class SceneCoordinator: Coordinator {

    var window: UIWindow
    let rootViewController = UINavigationController()
    var screenCoordinator: ScreenCoordinator?

    init(window: UIWindow) {
        self.window = window
        window.rootViewController = rootViewController
    }

    func start() {
        let screenCoordinator = ScreenCoordinator(presenter: rootViewController)
        screenCoordinator.start()
        self.screenCoordinator = screenCoordinator
    }
}
