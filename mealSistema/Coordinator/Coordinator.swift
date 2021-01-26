//
//  Coordinator.swift
//  mealSistema
//
//  Created by Aprizal on 26/1/21.
//

import Foundation
import UIKit
protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
