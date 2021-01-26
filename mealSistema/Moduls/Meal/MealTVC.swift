//
//  MealTVC.swift
//  mealSistema
//
//  Created by Aprizal on 26/1/21.
//

import UIKit

class MealTVC: UITableViewController {
    
    weak var coordinator: AppCoordinator?
    var viewModel: MealViewModel?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(cellType: MealCell.self)
        tableView.tableFooterView = UIView()
        viewModel?.changeHandler = { changes in
            switch changes {
            case .updateDataModel:
                self.tableView.reloadData()
            case .error(let message):
                print(message)
            case .loaderStart:
                break
            case .loaderEnd:
                break
            }
        }
        viewModel?.processGetMeals()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel?.meals.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: MealCell.self, for: indexPath)
        if let meal = viewModel?.meals[indexPath.row] {
            cell.bind(with: meal)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.processShowDetail(indexpath: indexPath)
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

  
    
}
