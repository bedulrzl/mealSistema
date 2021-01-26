//
//  MealViewModel.swift
//  mealSistema
//
//  Created by Aprizal on 26/1/21.
//

import Alamofire
import UIKit
 
class MealViewModel: BaseViewModel {
    
    var manager: APIClient = APIClient.shared
    var changeHandler: ((BaseViewModelChange) -> Void)?
    var didSelectedMeal: ((_ idMeal: String) -> Void)?
    var responseHandler: ((Swift.Result<MealResponse, Error>) -> Void)!
    var meals: [Meal] = [] {
        didSet {
            changeHandler?(.updateDataModel)
        }
    }
    
    init() {
        self.getData()
    }
    
    private func getData() {
        responseHandler = { result in
            switch result {
            case .success(let response):
                self.meals.append(contentsOf: response.meals)
                print(response.meals)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func processShowDetail(indexpath: IndexPath) {
        self.didSelectedMeal?(meals[indexpath.row].idMeal)
    }
    
    func processGetMeals() {
        manager.request(route: .meal(mealPage: "Seafood"), completion: responseHandler)
    }
}
