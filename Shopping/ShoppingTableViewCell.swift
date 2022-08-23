//
//  ShoppingTableViewCell.swift
//  TrendMedia
//
//  Created by 이도헌 on 2022/07/19.
//

import UIKit

class ShoppingTableViewCell: UITableViewCell {

    
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var checkListLabel: UILabel!
    @IBOutlet weak var favoritesButton: UIButton!
    
    func setData(data: UserShoppinglist) {
        
        checkListLabel.text = data.list
        self.backgroundColor = .secondarySystemBackground
        checkListLabel.textColor = .black
        checkListLabel.font = .systemFont(ofSize: 16)
        
        checkButton.setTitle("", for: .normal)
        favoritesButton.setTitle("", for: .normal)
        favoritesButton.tintColor = .black
        
        let checkImage = data.todo ? "checkmark.square.fill" : "checkmark.square"
        checkButton.setImage(UIImage(systemName: checkImage), for: .normal)
        
        let favoriteImage = data.favorite ? "star.fill" : "star"
        favoritesButton.setImage(UIImage(systemName: favoriteImage), for: .normal)

    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
