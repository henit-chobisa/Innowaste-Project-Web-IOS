//
//  RegisterViewController.swift
//  TeamRash_InnoWaste
//
//  Created by Henit Work on 10/04/21.
//

import UIKit
import Lottie
import FirebaseFirestore
import FirebaseStorage
import Firebase


class RegisterViewController: UIViewController, UINavigationControllerDelegate {
    var picker = UIImagePickerController()
    @IBOutlet weak var dummyImage: UIImageView!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var pincodefeild: UITextField!
    @IBOutlet weak var cityfield: UITextField!
    @IBOutlet weak var ageFeild: UITextField!
    @IBOutlet weak var namefeild: UITextField!
    @IBOutlet weak var backgroundAnimation: AnimationView!
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    let db = Firestore.firestore()
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundAnimation.loopMode = .loop
        backgroundAnimation.contentMode = .scaleAspectFit
        DispatchQueue.main.async {
            self.backgroundAnimation.play()
        }
        modalPresentationCapturesStatusBarAppearance = true
        submitButton.layer.cornerRadius = 15
        pincodefeild.layer.cornerRadius = 15
        cityfield.layer.cornerRadius = 15
        ageFeild.layer.cornerRadius = 15
        namefeild.layer.cornerRadius = 15
        submitButton.layer.cornerRadius = 20
        dummyImage.layer.cornerRadius = 153/2
        dummyImage.layer.borderWidth = 3
        dummyImage.layer.borderColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func imageChange(_ sender: UIButton) {
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    
    func handwithdatabase(k : String){
        self.db.collection("userList").addDocument(data: ["email" : Auth.auth().currentUser?.email! as Any , "username" : self.namefeild.text ?? "No Name" , "photo" : k])
        

        self.db.collection((Auth.auth().currentUser?.email)!).addDocument(data: ["Email" : (Auth.auth().currentUser?.email)!, "UserName" : namefeild.text! ?? "Username_undefined" , "Name" : self.namefeild.text ?? "No Name" , "Age" : self.ageFeild.text, "city" : cityfield.text!, "pincode" : pincodefeild.text! , "Photo" : k ])
        
        
        DispatchQueue.main.async {
            self.dismiss(animated: true)
        }
    }
    
    @IBAction func submitButtonHit(_ sender : UIButton) {
        
        let data = dummyImage.image?.jpegData(compressionQuality: 0.7)
        let imageReference = Storage.storage().reference().child((Auth.auth().currentUser?.email)!).child("\(String(describing: Auth.auth().currentUser?.email)) profile Image")
        imageReference.putData(data!, metadata: nil) { (meta, error2) in
            imageReference.downloadURL { (url, error) in
                self.handwithdatabase(k: url!.absoluteString)
                
              
            }
        }
        performSegue(withIdentifier: "tobingo", sender: self)
    }
    
    
    
    @IBAction func back(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    


}

extension RegisterViewController : UIImagePickerControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else {
            return
        }
        
        dismiss(animated: true)
        dummyImage.image = image
    }
    
    
}
