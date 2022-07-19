//
//  ShoppingTableViewCell.swift
//  TrendMedia
//
//  Created by 이도헌 on 2022/07/19.
//

import UIKit

class ShoppingTableViewCell: UITableViewCell {

    @IBOutlet weak var checkImage: UIImageView!
    @IBOutlet weak var checkListLabel: UILabel!
    @IBOutlet weak var favoritesButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
