//
//  ViewModel.swift
//  TrainingApp
//
//  Created by Kostyantyn Koloskov on 26.01.2021.
//

import Foundation

protocol ViewModel: class {
}

protocol ViewModelInputs: class {
    func viewDidLoad()
}

protocol ViewModelOutputs: class {
    var didReceiveServiceError: ((Error) -> Void) { get set }
}
