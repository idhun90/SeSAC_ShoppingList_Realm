//
//  SceneDelegate.swift
//  TrendMedia
//
//  Created by 이도헌 on 2022/07/18.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
        UserDefaults.standard.set(false, forKey: "First")
        // 다른 화면에 배치해야 한다. 조건이 항상 같기 때문에
        // true이면 환영합니다 viewController, false SearchTableViewContrller를 띄운다.
        
        // 중복 되는 코드 밖으로 빼기
        
//        guard let _ = (scene as? UIWindowScene) else { return } // 기본적으로 스토리보드에서 작업할 수 있도록 애플이 구현한 코드이다. 우리가 직접 코드로 화면을 만들고 루트뷰를 만들려면 아래로 따로 생성해야 하기 때문이다. // var window: UIWindow? 이걸 통해서
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene) // 하나의 씬을 윈도우에 생성해줌
        
        if UserDefaults.standard.bool(forKey: "First") {
            
            //        와일드 카드에서 상수명 지정
                    
                    // 가장 첫번째로 뜰 화면, 루트뷰를 생성
                    let sb = UIStoryboard(name: "Trend", bundle: nil)
                    let vc = sb.instantiateViewController(withIdentifier: "TrendViewController") as! TrendViewController
                    // 첫 시작화면 만들기
                    window?.rootViewController = vc
                    // 루트뷰 설정만 했지만 디바이스에 비춰주기 위한 추가 코드가 필요
            
        } else {
            //        와일드 카드에서 상수명 지정
                    
                    // 가장 첫번째로 뜰 화면, 루트뷰를 생성
                    let sb = UIStoryboard(name: "Search", bundle: nil)
                    let vc = sb.instantiateViewController(withIdentifier: "SearchTableViewController") as! SearchTableViewController
                    // 첫 시작화면 만들기
//                    window?.rootViewController = vc
            window?.rootViewController = UINavigationController(rootViewController: vc) // 네비게이션 추가
                    // 루트뷰 설정만 했지만 디바이스에 비춰주기 위한 추가 코드가 필요
        }
        
        window?.makeKeyAndVisible()
        
        
        


        
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

