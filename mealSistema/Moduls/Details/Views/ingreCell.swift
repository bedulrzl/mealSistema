//
//  ingreCell.swift
//  mealSistema
//
//  Created by Aprizal on 27/1/21.
//

import UIKit

class ingreCell: UITableViewCell {

    @IBOutlet weak var measLabel: UILabel!
    @IBOutlet weak var ingeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bind(with ingre: Ingre) {
        measLabel.text = ingre.value
        ingeLabel.text = ingre.title
    }
    
}
