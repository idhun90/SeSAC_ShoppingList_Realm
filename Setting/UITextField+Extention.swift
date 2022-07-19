//
//  UITextField+Extention.swift
//  TrendMedia
//
//  Created by 이도헌 on 2022/07/19.
//

import UIKit

extension UITextField {
    
    func borderColor() {
        self.layer.borderColor = UIColor.black.cgColor // 뷰컨트롤러와 달리 view라는 이름이 없어서, 본인 자신을 의미하는 self를 사용한다.
        self.layer.borderWidth = 1.0
        self.borderStyle = .none
    }
    
}
