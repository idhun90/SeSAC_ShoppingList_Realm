//
//  RecommandCollectionViewCell.swift
//  TrendMedia
//
//  Created by 이도헌 on 2022/07/20.
//

import UIKit

class RecommandCollectionViewCell: UICollectionViewCell {
    
    
    // 타입 프로퍼티 활용. cell의 identifier를 등록.
    static let identifier = "RecommandCollectionViewCell"
    
    @IBOutlet weak var posterImageView: UIImageView!
}
