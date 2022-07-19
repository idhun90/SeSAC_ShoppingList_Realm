//
//  BucketlistTableViewController.swift
//  TrendMedia
//
//  Created by 이도헌 on 2022/07/19.
//

import UIKit

class BucketlistTableViewController: UITableViewController {
    
    // 객체들이 Table View Cell에 올라져 있어서 아울렛 변수를 올리 수 없다.
    // 테이블뷰쎌에 대한 파일을 만든다
    
    @IBOutlet weak var userTextField: UITextField!
    
    var list = ["범죄도시2", "탑건", "마녀2", "토르"]

    override func viewDidLoad() {
        super.viewDidLoad()
        list.append("마녀")
        list.append("ㅁㅁㅁ")

    }

    @IBAction func userTextFieldReturn(_ sender: UITextField) {
        
        list.append(sender.text!)
        print(list)
        
        //중요!
        //데이터가 달라지는 시점에서 항상 테이블뷰 갱신을 요청
        // tableView.numberOfRows(inSection: <#T##Int#>) // 등록되어 있는 열
        // tableView.cellForRow(at: <#T##IndexPath#>) // 해당 열에 들어가는 내용들
        // 이 두가지를 모두 호출하기 위해 아래 코드가 생겼다
        tableView.reloadData()
//        tableView.reloadSections(<#T##sections: IndexSet##IndexSet#>, with: .fade)
        // tableView.reloadRows(at: [IndexPath(row: 0, section: 0), IndexPath(row: 1, section: 0)], with: .fade)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // indexpath를 bucketlisttableviewCell에 넘겨서 for 매개변수를 쓴다.
        let cell = tableView.dequeueReusableCell(withIdentifier: "BucketListTableViewCell", for: indexPath) as! BucketListTableViewCell // as? 타입 캐스팅
        
        cell.bucketlistLabel.text = list[indexPath.row]
        cell.bucketlistLabel.font = .boldSystemFont(ofSize: 18)
        
        // 애플이 권장하는 폰트 사이즈
        // 탭바 밑에 글씨 사이즈: 11, 12
        // 네비게이션 타이틀 사이즈 17
        // 채팅 내용 : 13, 14
        // 아이폰설정셀높이: 44
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    //에딧
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true // 편집이 가능한 상태로 된다. 좌우 스와이프가 가능해진다. 아래 코드
    }
    
    // 우측 스와이프 디폴트 기능 commit editingStyle
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            // 배열 삭제 후 테이블 뷰 반영
            list.remove(at: indexPath.row)
            tableView.reloadData()
//            tableView.reloadSections(<#T##sections: IndexSet##IndexSet#>, with: <#T##UITableView.RowAnimation#>) // 이걸로 여러 삭제 애니메이션 확인해보기
        }
    }
    
//    // 오른쪽에서 스와이프 기능
//    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        //즐겨찾기 핀 고정
//    }
    
}
