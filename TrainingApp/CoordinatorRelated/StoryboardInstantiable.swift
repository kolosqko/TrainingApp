//
//  StoryboardInstantiable.swift
//  TrainingApp
//
//  Created by Kostyantyn Koloskov on 26.01.2021.
//

import Foundation
import UIKit

protocol StoryboardInstantiable {
    static func instantiateViewController(_ bundle: Bundle?) -> Self
}

extension StoryboardInstantiable where Self: UIViewController {

    static func instantiateViewController(_ bundle: Bundle? = nil) -> Self {
        // swiftlint:disable:next force_unwrapping
        let defaultFileName = NSStringFromClass(self.classForCoder()).components(separatedBy: ".").last!
        let sb = UIStoryboard(name: defaultFileName, bundle: bundle)
        // swiftlint:disable:next force_cast
        return sb.instantiateInitialViewController() as! Self
    }
}
