//
//  Coordinator.swift
//  CoordinatorTest
//
//  Created by Vitaly Gromov on 14.04.2024.
//

import Foundation
import UIKit

protocol CoordinatorProtocol {
    func moveTo(destination: Destinations)
}

enum Destinations {
    case red, green, blue
}

class Coordinator: CoordinatorProtocol {
    
    lazy var redVC = ViewControllerRed(coordinator: self)
    lazy var greenVC: ViewControllerGreen = ViewControllerGreen(coordinator: self)
    lazy var blueVC = ViewControllerBlue(coordinator: self)
    
    init(navC: UINavigationController) {
        self.navC = navC
    }
    
    var navC: UINavigationController
    
    func moveTo(destination: Destinations) {
        switch destination {
        case .red:
            self.navC.popToRootViewController(animated: true)
        case .green:
            self.navC.pushViewController(greenVC, animated: true)
        case .blue:
            self.navC.setViewControllers([redVC, blueVC], animated: true)
        }
    }
    
    func start() {
        self.navC.pushViewController(redVC, animated: true)
    }
    
}
