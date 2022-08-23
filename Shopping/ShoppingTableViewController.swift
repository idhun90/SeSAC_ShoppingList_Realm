import UIKit

import RealmSwift

class ShoppingTableViewController: UITableViewController {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var headView: UIView!
    @IBOutlet weak var subView: UIView! // Cell의 width와 concerRadius를 통일해주기 위해 추가
    
    var shopingList: [String] = []
    
    // 8.22일 추가
    // 경로 접근
    let localRealm = try! Realm()
    
    // 저장된 Realm 데이터 담을 변수
    var tasks: Results<UserShoppinglist>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldUI()
        addButtonUI()
        subViewUI()
        // 8.22일 추가
        savedRealmData()
        print("=====현재 tasks 갯수: \(tasks.count)=====")
        print("Realm is located at:", localRealm.configuration.fileURL!)
    }

    @IBAction func addList(_ sender: UIButton) {
        // 8.22일 추가
        guard let text = searchTextField.text else { return }
        if text.trimmingCharacters(in: .whitespaces).isEmpty {
            showAlertMessage()
        } else {
            let task = UserShoppinglist(list: text, created: Date())
        
            try! localRealm.write {
                localRealm.add(task)
                print("Realm Succeed")
                savedRealmData()
                tableView.reloadData()
            }
        }
        
        
//        shopingList.append(searchTextField.text!)
//        tableView.reloadData()
//        searchTextField.text = ""
        
    }
    
    @IBAction func addListByReturn(_ sender: UITextField) {
        // 8.22일 추가
        guard let text = sender.text else { return }
        if text.trimmingCharacters(in: .whitespaces).isEmpty {
            showAlertMessage()
        } else {
            let task = UserShoppinglist(list: text, created: Date())
            
            try! localRealm.write {
                localRealm.add(task)
                print("Realm Succeed")
                savedRealmData()
                tableView.reloadData()
            }
        }
        
//        shopingList.append(searchTextField.text!)
//        tableView.reloadData()
//        searchTextField.text = ""
        
    }
    @IBAction func clickedFavoriteButton(_ sender: UIButton) {
        
        try! self.localRealm.write {
            self.tasks[sender.tag].favorite = !self.tasks[sender.tag].favorite
            print("즐겨찾기 버튼 Bool값 변경")
        }
        tableView.reloadData()
        
    }
    
    @IBAction func clickedTodoButton(_ sender: UIButton) {
        
        try! self.localRealm.write {
            self.tasks[sender.tag].todo = !self.tasks[sender.tag].todo
            print("체크 버튼 Bool값 변경")
        }
        tableView.reloadData()
        
    }
    
    // 8.22일 추가
    // RealmData 변수에 담기
    func savedRealmData() {
        tasks = localRealm.objects(UserShoppinglist.self).sorted(byKeyPath: "list", ascending: true)
    }
    // 8.22일 추가
    func showAlertMessage() {
        let alert = UIAlertController(title: "텍스트를 입력하세요.", message: nil, preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default)
        
        alert.addAction(ok)
        self.present(alert, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return shopingList.count
        // 8.22일 추가
        return tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingTableViewCell", for: indexPath) as! ShoppingTableViewCell
        

        cell.checkButton.tag = indexPath.row
        cell.favoritesButton.tag = indexPath.row
        
        cell.setData(data: tasks[indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    // Edit 허용
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    // 스와이프 디폴트 구현
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // 8.22일 추가
            let taskToDelete = tasks[indexPath.row]
            try! localRealm.write {
                localRealm.delete(taskToDelete)
                tableView.reloadData()
            }
            //shopingList.remove(at: indexPath.row)
            //tableView.reloadData()
        }
    }
    
//    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 0
//    }
    
    
    
    // 텍스트 필드 UI 초기화
    func textFieldUI() {
        searchTextField.placeholder = "무엇을 구매하실 건가요?"
        searchTextField.attributedPlaceholder = NSAttributedString(string: "무엇을 구매하실 건가요?", attributes: [NSAttributedString.Key.foregroundColor : UIColor.systemGray])
        searchTextField.borderStyle = .none
    }
    
    // '추가'버튼 UI 초기화
    func addButtonUI() {
        addButton.setTitle("추가", for: .normal)
        addButton.setTitleColor(.black, for: .normal)
        addButton.backgroundColor = .systemGray5
        addButton.layer.cornerRadius = 10
    }
    
    
    func subViewUI() {
        subView.backgroundColor = .secondarySystemBackground
        subView.layer.cornerRadius = 10.0
    }
    

}
