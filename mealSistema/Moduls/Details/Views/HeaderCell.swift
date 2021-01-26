//
//  HeaderCell.swift
//  mealSistema
//
//  Created by Aprizal on 27/1/21.
//

import UIKit

class HeaderCell: UITableViewCell {

    @IBOutlet weak var imageHeader: UIImageView!
    @IBOutlet weak var titleHeader: UILabel!
    @IBOutlet weak var kategoriHeader: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bind(with detail: Detail){
        titleHeader.text = detail.strMeal
        kategoriHeader.text = detail.strCategory
        guard let url = URL(string: detail.strMealThumb) else { return }
        imageHeader.kf.setImage(with: url)
    }
    
}
