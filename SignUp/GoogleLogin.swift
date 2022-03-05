//
//  GoogleLogin.swift
//  SignUp
//
//  Created by Janitha Katukenda on 2022-03-04.
//

import UIKit
import FirebaseAuth
import GoogleSignIn


extension SignInViewController: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error{
            print("Error because \(error.localizedDescription)")
            return
        }
        
        guard let auth = user.authentication else{return}
        let credentails = GoogleAuthProvider.credential(withIDToken: auth.idToken, accessToken: auth.accessToken)
        
        Auth.auth().signIn(with: credentails) { (authResults, error) in
            if let error = error{
                print("Error because \(error.localizedDescription)")
                return
            }
            
            print("successfull sign in to our firebase")
            print("\(user.profile.email ?? "No Email")")
            print("\(user.profile.name ?? "No Email")")
            
            
            loginTOHome()
        }
        
        func loginTOHome() {
            
            
            
            let vc = storyboard?.instantiateViewController(identifier: "home") as! HomeViewController
            vc.modalPresentationStyle = .fullScreen
            present(vc,animated: true)
        }
        
    }
    
    
    
}
