//
//  SignUpViewController.swift
//  SignUp
//
//  Created by Janitha Katukenda on 2022-03-01.
//

import UIKit

class SignUpViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var cameraPreview: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Registration"
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    @IBAction func tappedCameraButton(_ sender: Any) {
        
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        cameraPreview?.image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        picker.dismiss(animated: true, completion: nil)
    }

    @IBAction func didTapButton() {
        let vc = storyboard?.instantiateViewController(identifier: "login") as! SignInViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc,animated: true)
    }

}
