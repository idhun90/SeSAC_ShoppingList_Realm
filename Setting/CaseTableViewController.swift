enum HeaderTitle: String {
    case setting = "전체 설정"
    case personalSetting = "개인 설정"
    case others = "기타"
}
import UIKit

class CaseTableViewController: UITableViewController {
    
    var settingRowsName = ["공지사항", "실험실", "버전 정보"]
    var personalSettingName = ["개인/보안", "알림", "채팅", "멀티프로필"]
    var othersName = ["고객센터/도움말"]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    
        switch section {
        case 0: return HeaderTitle.setting.rawValue
        case 1: return HeaderTitle.personalSetting.rawValue
        case 2: return HeaderTitle.others.rawValue
        default: return "section"
        }
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0: return settingRowsName.count
        case 1: return personalSettingName.count
        case 2: return othersName.count
        default: return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "case2")!
        
        switch indexPath.section {
        case 0: cell.textLabel?.text = settingRowsName[indexPath.row]
        case 1: cell.textLabel?.text = personalSettingName[indexPath.row]
        case 2: cell.textLabel?.text = othersName[indexPath.row]
        default : return cell
        }

        return cell
    }
}
