//
//  MealCell.swift
//  mealSistema
//
//  Created by Aprizal on 26/1/21.
//

import UIKit
import Kingfisher

class MealCell: UITableViewCell {
    @IBOutlet weak var mealImage: UIImageView!
    @IBOutlet weak var labelMealName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bind(with meal: Meal) {
        labelMealName.text = meal.strMeal
        guard let url = URL(string: meal.strMealThumb) else { return }
        mealImage.kf.setImage(with: url)
        
    }
    
}
