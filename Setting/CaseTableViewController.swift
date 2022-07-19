enum HeaderTitle: String {
    case setting = "전체 설정"
    case personalSetting = "개인 설정"
    case others = "기타"
}

// 7/19일 열거형 적용
// CaseIterable: 프로토콜, 배열처럶 열거형을 활용할 수 있는 특성을 가지고 있다.
enum SettingOptions: Int, CaseIterable {
    
    case total, personal, others
    
    var sectionTitle: String {
        switch self {
        case .total:
            return "전체 설정"
        case .personal:
            return "개인 설정"
        case .others:
            return "기타"
        }
    }
    
    var rowTitle: [String] {
        switch self {
        case .total:
            return ["공지사항", "실험실", "버전 정보"]
        case .personal:
            return ["개인/보안", "알림", "채팅", "멀티프로필"]
        case .others:
            return ["고객센터/도움말"]
        }
    }
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
//        return 3
        return SettingOptions.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    
//        switch section {
//        case 0: return HeaderTitle.setting.rawValue
//        case 1: return HeaderTitle.personalSetting.rawValue
//        case 2: return HeaderTitle.others.rawValue
//        default: return nil
//        }
        return SettingOptions.allCases[section].sectionTitle
        

    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
//        switch section {
//        case 0: return settingRowsName.count
//        case 1: return personalSettingName.count
//        case 2: return othersName.count
//        default: return 0
//        }
        
//        SettingOptions.allCases[0].sectionTitle
//        SettingOptions.allCases[2].rowTitle
//
//        if section == 0 {
//            return SettingOptions.allCases[section].rowTitle.count
//        } else if section == 1 {
//            SettingOptions.allCases[section].rowTitle.count
//        }
        
        return SettingOptions.allCases[section].rowTitle.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "case2")!
        
//        switch indexPath.section {
//        case 0: cell.textLabel?.text = settingRowsName[indexPath.row]
//        case 1: cell.textLabel?.text = personalSettingName[indexPath.row]
//        case 2: cell.textLabel?.text = othersName[indexPath.row]
//        default : return cell
//        }
        
        cell.textLabel?.text = SettingOptions.allCases[indexPath.section].rowTitle[indexPath.row]
        return cell
    }
}
