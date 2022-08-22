//7.20일
import Foundation

struct Movie {
    var title: String
    var releaseDate: String
    var runtime: Int
    var overview: String
    var rate: Double
    
    var movieDescription: String {
            return "\(releaseDate), \(runtime)분, \(rate)점" // 한 줄은 return을 생략할 수 있다
    }
}
