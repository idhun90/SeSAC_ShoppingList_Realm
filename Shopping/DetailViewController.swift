import UIKit
import SnapKit

class DetailViewController: UIViewController {
    
    let label: UILabel = {
        let view = UILabel(frame: .zero)
        view.backgroundColor = .clear
        view.textAlignment = .center
        view.font = .boldSystemFont(ofSize: 20)
        view.textColor = .white
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        view.addSubview(label)
        
        label.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.leading.greaterThanOrEqualToSuperview().offset(10)
            $0.trailing.greaterThanOrEqualToSuperview().inset(-10)
        }
    }
    
}
