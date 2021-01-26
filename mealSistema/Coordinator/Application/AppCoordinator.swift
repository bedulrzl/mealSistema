//
//  AppCoordinator.swift
//  mealSistema
//
//  Created by Aprizal on 26/1/21.
//

import UIKit

class AppCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = [Coordinator]()
    var navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
        let viewController = MealTVC()
        let viewModel = MealViewModel()
        viewController.coordinator = self
        viewController.viewModel = viewModel
        viewModel.didSelectedMeal = { idMeal in
            self.startDetail(with: idMeal)
        }
        navigationController.pushViewController(viewController, animated: true)
    }
}
extension AppCoordinator {
    func startDetail(with idMeal: String) {
        let detailCoordinator = DetailCoordinator(navigationController: navigationController, idMeal: idMeal)
        detailCoordinator.start()
    }
}
