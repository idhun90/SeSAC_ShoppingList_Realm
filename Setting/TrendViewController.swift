//
//  TrendViewController.swift
//  TrendMedia
//
//  Created by 이도헌 on 2022/07/19.
//

import UIKit

class TrendViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 익스텐션 활용
        setBackgroundColor()
        searchTextField.borderColor()
    }

}
