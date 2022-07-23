//
//  BucketlistTableViewController.swift
//  TrendMedia
//
//  Created by 이도헌 on 2022/07/19.
//

import UIKit

class BucketlistTableViewController: UITableViewController {
    
    static let identifier = "BucketlistTableViewController"
    
    // 객체들이 Table View Cell에 올라져 있어서 아울렛 변수를 올리 수 없다.
    // 테이블뷰쎌에 대한 파일을 만든다
    
    @IBOutlet weak var userTextField: UITextField!
    
    // 7/22 데이터 저장 공간
    var textfiledPlaceholder: String?
    // 옵셔널 스트링 타입으로 선언해도 오류가 뜨지 않는 이유는?
    //.placeholder 자체도 nil 값을 받는 옵셔널 타입이기 때문에
    // 하지만 문자열 보간법이라면? X -> '??'로 처리
    
    
    var list = ["범죄도시2", "탑건", "마녀2", "토르"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //7.22
        // 아울렛 변수에 바로 갑이 할당이 안 된다. -> 아울렛 변수는 스토리보드와 매칭이 되고 코드가 작성이 되는데, 바로 값을 할당하면 스토리보드가 구현되기 전에 실행되는 코드여서 nil이 발생한다.
        userTextField.text = ""
        userTextField.placeholder = "\(textfiledPlaceholder ?? "영화")를 입력해주세요"
        //문자열 보간법에는 nil 값이 들어가면 안 되기 때문에 ?? 로 nil 처리를 해야 한다.
        //-------
        list.append("마녀")
        
        // 7/21 수업
        navigationItem.title = "버킷리스트"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(closeButtonClicked))

    }
    
    @objc func closeButtonClicked() {
        self.dismiss(animated: true)
    }

    @IBAction func userTextFieldReturn(_ sender: UITextField) {
        
        // swift 5.7에서 if let이 달라진다.....ㅠ
        //case1 if let
        if let value = sender.text?.trimmingCharacters(in: .whitespacesAndNewlines), !value.isEmpty, (2...6).contains(value.count) {
            list.append(value)
            
            //중요!
            //데이터가 달라지는 시점에서 항상 테이블뷰 갱신을 요청
            // tableView.numberOfRows(inSection: <#T##Int#>) // 등록되어 있는 열
            // tableView.cellForRow(at: <#T##IndexPath#>) // 해당 열에 들어가는 내용들
            // 이 두가지를 모두 호출하기 위해 아래 코드가 생겼다
            tableView.reloadData()
    //        tableView.reloadSections(<#T##sections: IndexSet##IndexSet#>, with: .fade)
            // tableView.reloadRows(at: [IndexPath(row: 0, section: 0), IndexPath(row: 1, section: 0)], with: .fade)
            
        } else {
            // 토스트 메시지 팝업 띄우기
        }
            
        //case2 guard let 구문
            guard let value = sender.text?.trimmingCharacters(in: .whitespacesAndNewlines), !value.isEmpty, (2...6).contains(value.count) else {
                // 문제 발생시 사용자에게 알려줘야 한다
                return
            }
            list.append(value)
            tableView.reloadData()
            
        
//        list.append(sender.text!)
        print(list)
        
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
