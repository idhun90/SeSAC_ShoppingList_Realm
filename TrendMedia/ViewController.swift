//
//  ViewController.swift
//  TrendMedia
//
//  Created by 이도헌 on 2022/07/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    //언제 아울렛컬렉션을 사용하는 것이 좋을까?
    //언제 배열을 사용하는 것이 좋을까?
    // -> 반복이 반복될 때, 동일안 요소를 적용하고 싶을 때
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var dateLabel2: UILabel!
    
    // 제약도 아울렛 변수로 만들어 조절할 수 있다.
    @IBOutlet weak var lowViewLeadingConstant: NSLayoutConstraint!
    
    
    @IBOutlet var dateLabelCollection: [UILabel]!
    
    // 변수의 스코프
    let format = DateFormatter()
    
    // 클래스 멤버들이 초기화 되고 언제 실행될지 몰라서 속성 값 변경 코드를 이 곳에 작성이 어렵다.라고 이해하자. 일.단.은
    // 함수 안쪽에서 작성해줘야 한다.
//    format.dateFormat = "yyyy/MM/dd"
//    dateLabel.text = "aaaa"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 데이트포맷도 마찬가지다.
        format.dateFormat = "yyyy/MM/dd"
        lowViewLeadingConstant.constant = 120
        

        
    
    }
    
    func configureLabelDesign() {
        //1. 아울렛 컬렉션 활용 (계산기 기준: 그림자 UIView)
        for i in dateLabelCollection {
            i.font = .boldSystemFont(ofSize: 20)
            i.textColor = .brown
            print(i) // 아울렛 컬렉션 순서 체크
        }
        
        // 각 레이블에 텍스트 표시해줄 때
        // 시간이 지나면 0, 1이 무엇을 의미하는지 헷갈리고, 나중에 번거로울 수 있다.
        // 인덱스로 인한 데이터 접근은 추천하지 않는다.
        // 디자인적 요소를 작업할 떄만 사용하는 것을 추천
        dateLabelCollection[0].text = "첫번째 텍스트"
        dateLabelCollection[1].text = "첫번째 텍스트"
        
        //2 UILabel 배열 활용
        let labelArray = [dateLabel, dateLabel2]
        for i in labelArray {
            i?.font = .boldSystemFont(ofSize: 20)
            i?.textColor = .brown
        }
        // 레이블 텍스트 표시
        // 사용자가 입력하는 내용 처리는 명확하게 이름을 통해 작성하는 것을 추천
        dateLabel.text = "첫번째 텍스트"
        dateLabel2.text = "두번째 텍스트"
    }
    
    // 변수에 스코프

    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        
        // DateFormatter()를 어디에 작성하느냐
        // 디데이 계산기 기준 앱으로 임시로 사용하는 것이 아니라 앱이 항상 사용이 된다.
        // 생명 주기를 함수 내로 제한할 필요 없다.
        // 따라서 바깥쪽에서 설정해주는 것이 좋다. //28줄 참고
        // 앱의 용도에 따라 달라진다.
        let format = DateFormatter()
        format.dateFormat = "yyyy/MM/dd"
      
        let labeltext = dateLabel.text = format.string(from: sender.date)
        
    }
    
}



// 클래스나/구조체는
// 프로퍼티, 메소드를 가질 수 있다.
// 즉 멤버들이 있는데, 초기화할 때 값까지 바꿀 수가 없다. 28줄에 위 참고
