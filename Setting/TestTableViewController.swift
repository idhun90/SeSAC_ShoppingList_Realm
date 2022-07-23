//
//  TestTableViewController.swift
//  TrendMedia
//
//  Created by 이도헌 on 2022/07/20.
//

import UIKit

class TestTableViewController: UITableViewController {
    
    var movieList = MovieInfo()
    


//    ["해리포터", "마녀2", "암살", "괴물", "기묘한 이야기", "라이언 일병 구하기"]
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return movieList.movie.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TestTableViewCell", for: indexPath) as! TestTableViewCell
        
        let data = movieList.movie[indexPath.row]
        cell.configureCell(data: data)
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height / 8 //디바이스 전체 높이 비율로 잡는 방법
    }

}
