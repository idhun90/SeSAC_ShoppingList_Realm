//
//  BucketlistTableViewController.swift
//  TrendMedia
//
//  Created by 이도헌 on 2022/07/19.
//


struct Todo {
    var title: String
    var done: Bool
}

import UIKit

class BucketlistTableViewController: UITableViewController {
    
    static let identifier = "BucketlistTableViewController"
    
    // 객체들이 Table View Cell에 올라져 있어서 아울렛 변수를 올리 수 없다.
    // 테이블뷰쎌에 대한 파일을 만든다
    
    @IBOutlet weak var userTextField: UITextField! {
        didSet {
            userTextField.textAlignment = .center
            userTextField.font = .boldSystemFont(ofSize: 22)
            userTextField.textColor = .systemRed
            print("텍스트 필드 디드셋")
            // 이렇게 디드셋을 하면 사용자가 텍스트필드에 단어를 입력하거나 호출했을 때 호출해야겠지만, UI적 요소는 클래스로 만들어져 있기 때문에 클래스 내에 프로퍼티가 바뀌는 것이기 때문에 사용자가 입력해도 호출이 되지 않는다.
            // 클래스는 레퍼런스 타입 -> 인스턴스 자체를 변경하지 않는 이상, didset은 한 번만 호출될 것이다.
            // 아울렛 변수는 뷰 디드로드가 호출되기 직전에 nil이 아닌지 nil인지 알 수 있다. 그래서 뷰 디드로드에서 그것을 판단하고 속성 변경을 할 수 있다.
            // 뷰디드로드에 텍스트필드에 관련 코드가 없으면 즉 변경된느 코드가 없으면 실행될까? -> 실행된다. 왜지?
        }
    }
    
    // 7/22 데이터 저장 공간
    var textfiledPlaceholder: String?
    // 옵셔널 스트링 타입으로 선언해도 오류가 뜨지 않는 이유는?
    //.placeholder 자체도 nil 값을 받는 옵셔널 타입이기 때문에
    // 하지만 문자열 보간법이라면? X -> '??'로 처리
    
    // list 프로퍼티가 추가, 삭제 등 변경 되고 나서 항상 테이블뷰를 갱신!
    // 프로퍼티 옵저버를 사용해 개선
    // 딕셔너리로 영화와 태그를 구조화해준다.
    // 딕셔너리로 값을 관리하면 될까? --> 순서가 없다.
    
    var list = [Todo(title: "범죄도시", done: false), Todo(title: "탑건", done: false), Todo(title: "범죄도시", done: false), Todo(title: "탑건", done: false), Todo(title: "범죄도시", done: false), Todo(title: "탑건", done: false), Todo(title: "범죄도시", done: false), Todo(title: "탑건", done: false), Todo(title: "범죄도시", done: false), Todo(title: "탑건", done: false), Todo(title: "범죄도시", done: false), Todo(title: "탑건", done: false), Todo(title: "범죄도시", done: false), Todo(title: "탑건", done: false), Todo(title: "범죄도시", done: false), Todo(title: "탑건", done: false), Todo(title: "범죄도시", done: false), Todo(title: "탑건", done: false), Todo(title: "범죄도시", done: false), Todo(title: "탑건", done: false),Todo(title: "범죄도시", done: false), Todo(title: "탑건", done: false), Todo(title: "범죄도시", done: false), Todo(title: "탑건", done: false), Todo(title: "범죄도시", done: false), Todo(title: "탑건", done: false), Todo(title: "범죄도시", done: false), Todo(title: "탑건", done: false)] {
        didSet {
            tableView.reloadData() // list가 바뀌게 되면 테이블뷰를 갱신해라.
            print("리스트가 변경됨. \(list), \(oldValue)")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //7.22
        // 아울렛 변수에 바로 갑이 할당이 안 된다. -> 아울렛 변수는 스토리보드와 매칭이 되고 코드가 작성이 되는데, 바로 값을 할당하면 스토리보드가 구현되기 전에 실행되는 코드여서 nil이 발생한다.
        userTextField.text = ""
        userTextField.placeholder = "\(textfiledPlaceholder ?? "영화")를 입력해주세요"
        //문자열 보간법에는 nil 값이 들어가면 안 되기 때문에 ?? 로 nil 처리를 해야 한다.
        //-------
//        list.append("마녀")
        
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
//            list.append(value)
//            list.append(Todo(title: sender.text!, done: false))
            
            //중요!
            //데이터가 달라지는 시점에서 항상 테이블뷰 갱신을 요청
            // tableView.numberOfRows(inSection: <#T##Int#>) // 등록되어 있는 열
            // tableView.cellForRow(at: <#T##IndexPath#>) // 해당 열에 들어가는 내용들
            // 이 두가지를 모두 호출하기 위해 아래 코드가 생겼다
//            tableView.reloadData()
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
//            list.append(value)
        list.append(Todo(title: sender.text!, done: false))
//            tableView.reloadData()
            
        
//        list.append(sender.text!)
        print(list)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // indexpath를 bucketlisttableviewCell에 넘겨서 for 매개변수를 쓴다.
        let cell = tableView.dequeueReusableCell(withIdentifier: "BucketListTableViewCell", for: indexPath) as! BucketListTableViewCell // as? 타입 캐스팅
        
        cell.bucketlistLabel.text = list[indexPath.row].title
        cell.bucketlistLabel.font = .boldSystemFont(ofSize: 18)
        
        //7/27
        // 버튼을 Cell 스위프트 파일에 액션을 추가하면 버튼을 클릭시 모든 cell의 버튼에 적용된다.
        // 따라서 태그와 addtarget 구문 활용
        
        cell.checkboxButton.tag = indexPath.row
        
        cell.checkboxButton.addTarget(self, action: #selector(checkBoxButtonClicked(sender:)), for: .touchUpInside)
        // selector는 함.수.이.름.만 호출하면 된다
        
//        // 7/27일 코드
//        let value = list[indexPath.row].done ? "checkmark.square.fill" : "checkmark.square"
//        cell.checkboxButton.setImage(UIImage(systemName: value), for: .normal)
//        cell.checkboxButton.setTitle("", for: .normal)
        
        
        // 애플이 권장하는 폰트 사이즈
        // 탭바 밑에 글씨 사이즈: 11, 12
        // 네비게이션 타이틀 사이즈 17
        // 채팅 내용 : 13, 14
        // 아이폰설정셀높이: 44
        return cell
    }
    
    // 매개변수로 값을 전달 태그를 알 수 있게
    @objc func checkBoxButtonClicked(sender: UIButton) {
        
        print("\(sender.tag)번째 버튼 클릭")
        
        //배열 인덱스를 찾아서 done을 바꿔야 하고 테이블뷰를 갱신해야함.
        
//        내가 작성한 것
        if list[sender.tag].done == false {
            list[sender.tag].done = true
            sender.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
            sender.setTitle("", for: .normal)


        } else if list[sender.tag].done == true {
            list[sender.tag].done = false
            sender.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            sender.setTitle("", for: .normal)

        }
//
        tableView.reloadData()
        
//        // 수업 때 선생님이 작성하신 코드
//        list[sender.tag].done = !list[sender.tag].done // 반대값을 적용시켜준다.
        
//        이곳은 데이터만 바꿔주고 cell 디자인은 데이터에 따라 달라지기 때문에 디자인은 위에 코드에 적용해준다
        // 리스트가 변경되었기 때문에 DidSet이 실행되어 테이블뷰가 리로드된다. 리로드데이터는 작성하지 않아도 된다.
        
////        tableView.reloadData() // 전체 cell이 아니라 클릭한 cell의 데이터만 리로드
//        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade)
        // 하나의 cell 데이터만 리로드하는 구문을 추가했기 때문에 list의 디드셋은 비효율적이며 적합하지 않을 수 있다.
        
        
        
        // 재사용Cell 오류 코드
//        sender.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
//        sender.setTitle("", for: .normal)
        
        // 화면 기반으로 추가해주고 있어 재사용 셀에 그대로 버튼이 클릭된채로 발생한다.
        // 화면과 데이터는 따로 논다!
        // 데이터 작업 필요
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
//            tableView.reloadData()
//            tableView.reloadSections(<#T##sections: IndexSet##IndexSet#>, with: <#T##UITableView.RowAnimation#>) // 이걸로 여러 삭제 애니메이션 확인해보기
        }
    }
    
//    // 오른쪽에서 스와이프 기능
//    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        //즐겨찾기 핀 고정
//    }
    
}
