import UIKit

class ShoppingTableViewController: UITableViewController {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var headView: UIView!
    
    var shopingList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldUI()
        addButtonUI()
        headViewUI()
        
        
        
    }

    @IBAction func addList(_ sender: UIButton) {
        
        shopingList.append(searchTextField.text!)
        tableView.reloadData()
        searchTextField.text = "" // 버튼을 누르고 텍스트필드 빈공간으로 변경
        
    }
    
    @IBAction func addListByReturn(_ sender: UITextField) {
        
        shopingList.append(searchTextField.text!)
        tableView.reloadData()
        searchTextField.text = "" // 버튼을 누르고 텍스트필드 빈공간으로 변경
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        shopingList.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingTableViewCell", for: indexPath) as! ShoppingTableViewCell
        
        // Cell lable
        cell.checkListLabel.text = shopingList[indexPath.row]
        cell.backgroundColor = .secondarySystemBackground
        cell.checkListLabel.textColor = .black
        cell.checkListLabel.font = .systemFont(ofSize: 16)
        
        // Cell Image
        cell.checkImage.image = UIImage(systemName: "checkmark.square") //checkmark.square: 화이트 checkmark.square.fill:
        cell.checkImage.tintColor = .black
        
        // Cell Button
        cell.favoritesButton.setTitle("", for: .normal)
        cell.favoritesButton.setImage(UIImage(systemName: "star"), for: .normal) // star.fill
        cell.favoritesButton.tintColor = .black
        
//        헤더뷰 너비 조절 실패,,
//        tableView.tableHeaderView = headView
//        tableView.tableHeaderView?.frame.width = cell.frame.width
        
        
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
            shopingList.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    
    
    // 텍스트 필드 UI 초기화
    func textFieldUI() {
        searchTextField.placeholder = "무엇을 구매하실 건가요?"
        searchTextField.attributedPlaceholder = NSAttributedString(string: "무엇을 구매하실 건가요?", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        searchTextField.borderStyle = .none
    }
    
    //'추가'버튼 UI 초기화
    func addButtonUI() {
        addButton.setTitle("추가", for: .normal)
        addButton.setTitleColor(.black, for: .normal)
        addButton.backgroundColor = .systemGray5
        addButton.layer.cornerRadius = 10
    }
    
    
    func headViewUI() {
        headView.backgroundColor = .secondarySystemBackground
        headView.layer.cornerRadius = 30
        headView.layer.masksToBounds = true
    }

}
