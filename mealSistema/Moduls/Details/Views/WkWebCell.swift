//
//  WkWebCell.swift
//  mealSistema
//
//  Created by Aprizal on 27/1/21.
//

import UIKit
import WebKit

class WkWebCell: UITableViewCell {
    @IBOutlet weak var wkYtb: WKWebView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bind(with detail: Detail) {
        guard
            let youtubeURL = URL(string: detail.strYoutube)
            else { return }
        var id = youtubeURL.query
        id?.removeFirst(2)
        let url = URL(string: "https://www.youtube.com/embed/\(id ?? "")")
        wkYtb.load(URLRequest(url: url!))
        
    }
    
    
}
