//
//  DetailVC.swift
//  mealSistema
//
//  Created by Aprizal on 26/1/21.
//

import UIKit
import WebKit

class DetailVC: UIViewController {

    var viewModel: DetailViewModel?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(cellType: WkWebCell.self)
        tableView.register(cellType: HeaderCell.self)
        tableView.register(cellType: ingreCell.self)
        tableView.dataSource = self
        tableView.delegate = self
    
        bindViewModel()
    }
    func bindViewModel() {
        self.viewModel?.changeHandlerIngredients = { changes in
            switch changes {
            case .updateDataModel:
                self.tableView.reloadData()
            default:
                print(#function)
            }
        }
        
        self.viewModel?.changeHandler = { changes in
            switch changes {
            case .updateDataModel:
                let section1 = IndexPath(row: 0, section: 0)
                let section2 = IndexPath(row: 0, section: 1)
                self.tableView.reloadRows(at: [section1, section2], with: .automatic)
            default:
                print(#function)
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel?.processGetDetail()
    }

}

extension DetailVC: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0, 1:
            return 1
        case 2:
            return viewModel?.detailIngedients.count ?? 0
        default:
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
//            let wkCell = UITableViewCell()
            let cell = tableView.dequeueReusableCell(with: WkWebCell.self, for: indexPath)
            if let detail = viewModel?.details {
                cell.bind(with: detail)
            }
            cell.backgroundColor = .systemRed
            
            return cell
        case 1:

            let cell = tableView.dequeueReusableCell(with: HeaderCell.self, for: indexPath)
            if let detail = viewModel?.details {
                cell.bind(with: detail)
            }
        
            return cell
        default:

            let cell = tableView.dequeueReusableCell(with: ingreCell.self, for: indexPath)
            if let ingre = viewModel?.detailIngedients[indexPath.row] {
                cell.bind(with: ingre)
            }
          
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 150
        case 1:
            return 120
        default:
            return 50
        }
    }
}
