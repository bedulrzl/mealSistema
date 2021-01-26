//
//  DetailViewModel.swift
//  mealSistema
//
//  Created by Aprizal on 26/1/21.
//

import Alamofire
import UIKit

class DetailViewModel: BaseViewModel {
    var changeHandler: ((BaseViewModelChange) -> Void)?
    var changeHandlerIngredients: ((BaseViewModelChange) -> Void)?
 
    var idMeal: String?
    var manager: APIClient = APIClient.shared
    private var responHandler: ((Swift.Result<DetailResponse, Error>) -> Void)!
    var details: Detail? = nil {
        didSet {
            changeHandler?(.updateDataModel)
        }
    }
    var detailIngedients: [Ingre] = [] {
        didSet {
            changeHandlerIngredients?(.updateDataModel)
        }
    }
    init() {
        getDetail()
    }
    //COBA
    func getDetail(){
        responHandler = { result in
            switch result {
            case .success(let response):
                self.details = response.meals.first
                do {
                    let ingredients = try response.meals.first?.asDictionary().filter({ $0.key.contains("strIngredient") && ($0.value as! String) != "" })
                    let measure = try response.meals.first?.asDictionary().filter({$0.key.contains("strMeasure") && ($0.value as! String) != ""})
                    var values:[String?] = []
                    var valueMeasure:[String?] = []

                    for i in 1...ingredients!.count {
                        values.append((ingredients?["strIngredient\(i)"]) as? String)
                    }
                    
                    for i in 1...measure!.count {
                        valueMeasure.append((measure?["strMeasure\(i)"]) as? String)
                    }
                    for i in 0...ingredients!.count - 1 {
                        if let title = values[i], let value = valueMeasure[i] {
                            self.detailIngedients.append(Ingre(title: title, value: value))
                        }
                    }
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func processGetDetail(){
        guard let idMeal = idMeal else { return }
        self.manager.request(route: .mealDetail(genreId: idMeal), completion: responHandler)
    }
}
//NGARTI ORA SON
//ora
//apanya
//Jadi dia nge filter
//dia cek key nya dulu
//dia punya kata2 "strIngredient" itu ga
//kalo ada dia cek lagi, value nya kosong ga
//makanya yg kosong tuh dari 16 - 20 kan ga masuk
//nah next lu ambil values nya aja
