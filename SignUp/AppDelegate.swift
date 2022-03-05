//
//  AppDelegate.swift
//  SignUp
//
//  Created by Janitha Katukenda on 2022-03-01.
//
import GoogleSignIn
import Firebase
import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {
   
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      
        FirebaseApp.configure()
        
        GIDSignIn.sharedInstance()?.clientID = FirebaseApp.app()?.options.clientID
        
//        GIDSignIn.sharedInstance()?.clientID = "169616862013-badc6837c41447s39i1ppp3emcds6lp8.apps.googleusercontent.com"
//        GIDSignIn.sharedInstance()?.delegate = self
        return true
    }
    
    
    open func application(_ app: UIApplication, open url: URL, option: [UIApplication.OpenURLOptionsKey : Any] = [:])-> Bool {
        
        let handle = GIDSignIn.sharedInstance().handle(url)
        return handle
    }
    
//    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
//        print("User Email: \(user.profile.email ?? "No Email")")
//    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance().handle(url)
    }
    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
 
    }

}


