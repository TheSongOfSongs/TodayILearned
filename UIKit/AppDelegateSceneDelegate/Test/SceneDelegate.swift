//
//  SceneDelegate.swift
//  Test
//
//  Created by Jinhyang on 2021/09/02.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        print("[Scene Delegate] 1. scene will connect to session")
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        print("[Scene Delegate] 2. scene is disconnected to session")
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        print("[Scene Delegate] 3. scene did become active")
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        print("[Scene Delegate] 4. scene will resign active")
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        print("[Scene Delegate] 5. scene will enter foreground")
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        print("[Scene Delegate] 6. scene did enter background")
    }
}

