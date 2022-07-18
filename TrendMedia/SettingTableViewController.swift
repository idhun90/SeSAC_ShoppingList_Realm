//
//  SettingTableViewController.swift
//  TrendMedia
//
//  Created by 이도헌 on 2022/07/18.
//

import UIKit

class SettingTableViewController: UITableViewController {
    
    var birthdayFriends = ["김밥", "라면", "떡볶이", "짜장면", "짬뽕", "만두"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

    }
    // 섹션의 갯수(옵션)
    override func numberOfSections(in tableView: UITableView) -> Int {
        // 따로 코드를 작성하지 않아도, 디폴트 값은 1
        return 3
    }
    
    //섹션 구분
    //섹션 구분을 위해 section 매개변수가 있다. 인덱스 순서처럼 0번부터 시작한다.
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //헤더가 없을 수도 있어서 옵셔널
        
        if section == 0 {
            return "생일인 친구"
        } else if section == 1 {
            return "즐겨찾기"
        } else if section == 2 {
            return "친구"
        } else {
            return "섹션"
        }
        
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "푸터"
    }
    
    // 테이블뷰컨트롤러를 화면에 잘 보여주기 위해
    // 1. 셀의 갯수
    // ex. 카톡 100명 > cell 100개, 3000명 -> cell 3000개
    // 섹션마다 cell의 갯수가 다름 section 매개변수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return birthdayFriends.count
        } else if section == 1 {
            return 2
        } else if section == 2 {
            return 1
        } else {
            return 0
        }
        
    }
    
    // 2. 셀의 디자인과 데이터(필수)
    // ex. 카톡 사람마다 이름, 프로필 사진, 상태 메시지 등이 다른 값을 추가해주는 작업
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 재사용 셀 사용, 복붙효과
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell")! // for가 없는 것을 가져옴
        
        if indexPath.section == 0 {
            
//            if indexPath.row == 0 {
//                cell.textLabel?.text = birthdayFriends[indexPath.row]
//            } else if indexPath.row == 1 {
//                cell.textLabel?.text = birthdayFriends[indexPath.row]
//            } else if indexPath.row == 2 {
//                cell.textLabel?.text = birthdayFriends[indexPath.row]
//            }
            
            // 위 구문을 줄여서
            cell.textLabel?.text = birthdayFriends[indexPath.row]
            
            
            
            
            
            
            // 클래스라서 cell이 상수여도 수정이 가능하다.
//            cell.textLabel?.text = "셀 텍스트"
            cell.textLabel?.textColor = .systemRed
            cell.textLabel?.font = .boldSystemFont(ofSize: 20)
        } else if indexPath.section == 1 {
            cell.textLabel?.text = "1번 인덱스 텍스트"
            cell.textLabel?.textColor = .systemMint
            cell.textLabel?.font = .boldSystemFont(ofSize: 25)
        } else if indexPath.section == 2 {
            cell.textLabel?.text = "2번 인덱스 텍스트"
            cell.textLabel?.textColor = .systemBlue
            cell.textLabel?.font = .boldSystemFont(ofSize: 10)
        }
        
        // 마지막 리턴 cell을 마지막에 적어주었기 때문에 위에처럼 나머지 else조건을 안 써도 된다
        return cell
    }
}
