//
//  UIViewController+Extenstion.swift
//  TrendMedia
//
//  Created by 이도헌 on 2022/07/19.
//

import Foundation
import UIKit

extension UIViewController {
    
    func setBackgroundColor() {
        
        view.backgroundColor = .systemOrange
        
    }
    
    func showAlert() {
        
        let alert = UIAlertController(title: "익스텐션", message: "spq", preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default, handler: .none)
        
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
        
        
        
    }
}
