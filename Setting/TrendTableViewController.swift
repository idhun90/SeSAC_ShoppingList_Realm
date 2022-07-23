//
//  TrendTableViewController.swift
//  TrendMedia
//
//  Created by 이도헌 on 2022/07/21.
//

import UIKit

class TrendTableViewController: UITableViewController {

    @IBOutlet weak var movieButton: UIButton!
    @IBOutlet weak var dramaButton: UIButton!
    @IBOutlet weak var bookButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func movieButtonClicked(_ sender: UIButton) {
        
        // 화면전환: 스토리보드 파일 찾기 -> 스토리보드 내에 뷰컨트롤러 찾기 -> 화면 전환
        // 영화 버튼을 클릭 -> BucketlistTableViewController Present
        // 1.
        let sb = UIStoryboard(name: "Trend", bundle: nil)
        // 2.
        let vc = sb.instantiateViewController(withIdentifier: BucketlistTableViewController.identifier) as! BucketlistTableViewController
        // 3.
        
        // 값 전달
        // sender.currentTitle을 사용해도 좋을 것 같다. but 버튼 스타일 주의
        // sender.textLabel?.text
        vc.textfiledPlaceholder = "영화"
        self.present(vc, animated: true)
    }
    @IBAction func dramaButtonClicked(_ sender: UIButton) {
        
        let sb = UIStoryboard(name: "Trend", bundle: nil)
        // 2.
        let vc = sb.instantiateViewController(withIdentifier: BucketlistTableViewController.identifier) as! BucketlistTableViewController
        // 2.5 present style .fullscreen
//        vc.modalPresentationStyle = .fullScreen
        // 3.
        
        // 값 전달
        vc.textfiledPlaceholder = "드라마"
        self.present(vc, animated: true)
    }
    @IBAction func bookButtonClicked(_ sender: UIButton) {
        
        let sb = UIStoryboard(name: "Trend", bundle: nil)
        // 2.
        let vc = sb.instantiateViewController(withIdentifier: BucketlistTableViewController.identifier) as! BucketlistTableViewController
        
        // 네비게이션임베디드
        let nav = UINavigationController(rootViewController: vc)
    
        // 2.5 present style .fullscreen
        nav.modalPresentationStyle = .fullScreen
        // 3.
        
        vc.textfiledPlaceholder = "도서"
        self.present(nav, animated: true)
        
    }
}
