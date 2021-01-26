//
//  DetailCoordinator.swift
//  mealSistema
//
//  Created by Aprizal on 26/1/21.
//

import UIKit

class DetailCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    private var idMeal: String
    
    init(navigationController: UINavigationController, idMeal: String) {
        self.navigationController = navigationController
        self.idMeal = idMeal
    }
    
    func start() {
        let viewController = DetailVC()
        let viewModel = DetailViewModel()
        viewModel.idMeal = self.idMeal
        viewController.viewModel = viewModel
        navigationController.pushViewController(viewController, animated: true)
    }
}
