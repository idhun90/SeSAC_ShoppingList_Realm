//
//  RecommandCollectionViewController.swift
//  TrendMedia
//
//  Created by 이도헌 on 2022/07/20.
//

import UIKit
import Toast
import Kingfisher

class RecommandCollectionViewController: UICollectionViewController {
    
    //7.22일
    //1 값. 전달 - 데이터를 받을 공간(프로퍼티) 생성
    var movieTitle: String?
    // 2. 7.22
//    var movieData: Movie?
    // 따로 따로 프로퍼티 생성하지 않고 하나의 구조체 전체를 전달 받는 이유
    
    
    
    // ---------
    var imageURL = "https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20220708_123%2F1657272256389R34Q0_JPEG%2Fmovie_image.jpg"

    override func viewDidLoad() {
        super.viewDidLoad()
        // 7.22일 수업
        // 3. 값 전달 - 프로퍼티 값을 뷰에 표현
        title = movieTitle == nil ? "데이터 없음" : movieTitle! // title은 네비게이션바 타이틀이다.
        
        
        // ---------
        //컬렉션뷰 셀 크기, 셀 사이 간격 레이아웃 미리 설정(비율로 많이 잡기 때문)
        let layout = UICollectionViewFlowLayout() // 인스턴스 생성
        let spacing: CGFloat = 8 // 하나의 간격 상수를 만들어서 여러 곳에 적용하는 게 좋다. 관리에 용이 // cell과 cell 사이의 간격
        let width = UIScreen.main.bounds.width - (spacing * 4) // 디바이스의 값에 /3 (여백이 없다)
        // 셀의 크기
        layout.itemSize = CGSize(width: width / 3, height: (width / 3) * 1.2) // 보통 비율로 잡아준다.
        // 스크롤 방향
        layout.scrollDirection = .vertical
        // 여백
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        // Cell과 최소 간격(?) 두 차이점 알아보기
        layout.minimumLineSpacing = /*8*/ spacing // 리터럴 값 대신 하나의 상수로
        layout.minimumInteritemSpacing = spacing
        // 컬렉션뷰에 반영
        collectionView.collectionViewLayout = layout
        
        //iOS14이 후 새로운 방법도 있다.
        
    }
    
    /*
    테이블뷰 -> 컬렉션뷰
    Row -> Item
    heightForRowAt -> 아이템(Cell)의 너비와 높이가 다 달라서 사용 못 함 -> 새로운 기능 지원 -> FlowLayout (heightForItemAt이 없는 이유)
     */

    //테이블뷰와 똑같다
    //테이블뷰는 각각의 cell을 Row, 컬렉션뷰에서는 각각의 cell을 item이라고 부른다.
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //옵셔널 바인딩 활용 (7/21)
        //identifier 타입 프로퍼티 활용 (7/21)
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommandCollectionViewCell.identifier, for: indexPath) as? RecommandCollectionViewCell else { return UICollectionViewCell()}  // 안전성을 위해 기본 Cell 인스턴스를 생성해 반환
        cell.posterImageView.backgroundColor = .orange
        
        let url = URL(string: imageURL)
        cell.posterImageView.kf.setImage(with: url)
        cell.posterImageView.contentMode = .scaleAspectFill
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        view.makeToast("\(indexPath.row)번째 셀을 선택했습니다.")
        // 키보드가 올라왔을 떄 위치 조절을 위해 아래 코드가 있다
        view.makeToast("\(indexPath.item)번 째 셀을 선택했습니다.", duration: 1, position: .center)
        
        //7.21 수업
        self.navigationController?.popViewController(animated: true)
    }
}
