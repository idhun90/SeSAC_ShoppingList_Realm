//
//  SearchTableViewController.swift
//  TrendMedia
//
//  Created by 이도헌 on 2022/07/19.
//

import UIKit

class SearchTableViewController: UITableViewController {
    
    var moviePost: [String] = ["movieImage0.jpg", "movieImage1.jpg", "movieImage2.jpg", "movieImage3.jpg"]
    var movieName: [String] = ["탑건", "마녀2", "스파이더맨", "해리포터"]
    var movieReleaseTime: [String] = ["2022.07.01", "2022.07.02", "2022.05.01", "2020.01.01"]
    var movieStory: [String] = ["비행기 빵야빵야비행기 빵야빵야비행기 빵야빵야비행기 빵야빵야비행기 빵야빵야비행기 빵야빵야비행기 빵야빵야비행기 빵야빵야비행기 빵야빵야비행기 빵야빵야비행기 빵야빵야비행기 빵야빵야비행기 빵야빵야비행기 빵야빵야비행기 빵야빵야비행기 빵야빵야비행기 빵야빵야비행기 빵야빵야비행기 빵야빵야비행기 빵야빵야비행기 빵야빵야비행기 빵야빵야비행기 빵야빵야비행기 빵야빵야비행기 빵야빵야비행기 빵야빵야비행기 빵야빵야비행기 빵야빵야비행기 빵야빵야비행기 빵야빵야", "국내판 드래곤볼국내판 드래곤볼국내판 드래곤볼국내판 드래곤볼국내판 드래곤볼국내판 드래곤볼", "거미줄 휙휙거미줄 휙휙거미줄 휙휙거미줄 휙휙거미줄 휙휙거미줄 휙휙", "너도나도 마법사너도나도 마법사너도나도 마법사너도나도 마법사너도나도 마법사너도나도 마법사"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviePost.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
        
        cell.movieImageView.image = UIImage(named: moviePost[indexPath.row])
        
        cell.movieNameLabel.text = movieName[indexPath.row]
        cell.movieNameLabel.font = .boldSystemFont(ofSize: 17)
        
        
        cell.releaseDateLabel.text = movieReleaseTime[indexPath.row]
        cell.releaseDateLabel.font = .systemFont(ofSize: 13)
        
        
        cell.storyLabel.text = movieStory[indexPath.row]
        cell.storyLabel.font = .systemFont(ofSize: 13)
        cell.storyLabel.textColor = .systemGray
        cell.storyLabel.numberOfLines = 0
        cell.storyLabel.textAlignment = .natural
        
        return cell
    }
}
