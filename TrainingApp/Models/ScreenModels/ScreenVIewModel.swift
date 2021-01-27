//
//  ScreenVIewModel.swift
//  TrainingApp
//
//  Created by Kostyantyn Koloskov on 26.01.2021.
//

import Foundation

protocol ScreenViewModelProtocol: ViewModel {
    var inputs: ScreenInputsProtocol { get }
    var outputs: ScreenOutputsProtocol { get set }
}

protocol ScreenInputsProtocol: ViewModelInputs {
    func firstButtonPressed()
    func secondButtonPressed()
}

protocol ScreenOutputsProtocol: ViewModelOutputs {
    var data: ScreenDataProtocol { get set }
    var reloadData: ((ScreenDataProtocol) -> Void) { get set }
}

class ScreenViewModel: ScreenViewModelProtocol, ScreenInputsProtocol, ScreenOutputsProtocol {
    // MARK: - ScreenViewModelProtocol
    var inputs: ScreenInputsProtocol { return self }
    var outputs: ScreenOutputsProtocol {
        get { return self }
        // swiftlint:disable:next unused_setter_value
        set {}
    }

    // MARK: - ScreenInputsProtocol
    func viewDidLoad() {
        data.labelState = .noButtonPushed
        reloadData(data)
    }

    func firstButtonPressed() {
        data.labelState = .firstButtonPushed
        reloadData(data)
    }

    func secondButtonPressed() {
        data.labelState = .secondButtonPushed
        reloadData(data)
    }

    // MARK: - ScreenOutputsProtocol
    var data: ScreenDataProtocol

    var didReceiveServiceError: ((Error) -> Void) = { _ in }

    var reloadData: ((ScreenDataProtocol) -> Void) = { _ in }

    init() {
        self.data = ScreenData()
    }
}

struct ScreenData: ScreenDataProtocol {
    var labelState: LabelState = .noButtonPushed
}
