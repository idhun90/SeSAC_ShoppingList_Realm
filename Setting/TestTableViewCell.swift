//7월 20일 수업

import UIKit

class TestTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    
    func configureCell(data: Movie) { // cellForRow는 지속적으로 호출되기 때문에 [Stirng]이 아닌 String 단일 요소로 설정
        
        // movieList, indexPath.row를 찾지 못 하기 때문에 매개변수 추가
        titleLabel.font = .boldSystemFont(ofSize: 15)
        titleLabel.text = data.title
        releaseLabel.text = "\(data.releaseDate) | \(data.runtime)분 | \(data.rate)점"
        overviewLabel.text = data.overview
        overviewLabel.numberOfLines = 0
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
