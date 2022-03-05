//
//  SignInViewController.swift
//  SignUp
//
//  Created by Janitha Katukenda on 2022-03-01.
//

import UIKit
import FirebaseAuth
import GoogleSignIn

class SignInViewController: UIViewController {
    
    @IBOutlet var fieldUsername: UITextField!
    @IBOutlet var fieldPassword: UITextField!
    @IBOutlet var signInButon: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        googleSettup()
    }
    
    
    private func googleSettup(){
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.delegate = self
    }
    
    //dismiss keaboard when touch view
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func GoSignUp(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "new_second_page") as? secondViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    @IBAction func googleTapped(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
        //didTapButton()
    }
    
//    @IBAction func didTapButton() {
//        let vc = storyboard?.instantiateViewController(identifier: "home") as! HomeViewController
//        vc.modalPresentationStyle = .fullScreen
//        present(vc,animated: true)
//    }
}
