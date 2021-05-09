//
//  FeedInputViewController.swift
//  TeamRash_InnoWaste
//
//  Created by Henit Work on 11/04/21.
//

import UIKit
import Lottie
import Firebase


class FeedInputViewController: UIViewController, UINavigationControllerDelegate {
    
    
    
    @IBOutlet weak var postphoto: UIImageView!
    var titlechallenge = "ScooterLess"
    var descriptionchallenge = "Leave your vehicle for half destinations, get a medal with 3 points"
    var picker = UIImagePickerController()
    @IBOutlet weak var completechallenge: UIButton!
    @IBOutlet weak var postDescription: UITextField!
    @IBOutlet weak var friendname: UITextField!
    @IBOutlet weak var challengename: UILabel!
    @IBOutlet weak var deschall: UILabel!
    var db = Firestore.firestore()
    @IBOutlet weak var mainAnimationView: AnimationView!
    override func viewDidLoad() {
        super.viewDidLoad()
        mainAnimationView.backgroundColor = .clear
        mainAnimationView.contentMode = .scaleAspectFit
        mainAnimationView.loopMode = .loop
        DispatchQueue.main.async {
            self.mainAnimationView.play()
        }
        challengename.text = titlechallenge
        deschall.text = descriptionchallenge
        postDescription.layer.cornerRadius = 20
        friendname.layer.cornerRadius = 20
        completechallenge.layer.cornerRadius = 20

        // Do any additional setup after loading the view.
    }
    
    @IBAction func imageChange(_ sender: UIButton) {
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    
    func handwithdatabase(name : String,userImage : String,Age : String , City : String, pincode : String ,k : String){
        

        self.db.collection("PostCollection").addDocument(data: ["Email" : Auth.auth().currentUser?.email!, "UserName" : name ?? "Username_undefined","challenge_name" : "ScooterLess","challlenge_description" : "Leave your vehicle for half destinations, get a medal with 3 points" ,"City" : City ,"userImage" : userImage ,"pincode " : pincode,"challenge_photo" : k ])
        
        DispatchQueue.main.async {
            self.dismiss(animated: true)
        }
    }

    @IBAction func challengeCompleted(_ sender: Any) {
        
        db.collection((Auth.auth().currentUser?.email)!).getDocuments { (query, error) in
            for doc in query!.documents{
                let name = doc["UserName"] as! String
                let Age = doc["Age"] as! String
                let city = doc["city"] as! String
                let pincode = doc["pincode"] as! String
                let photo = doc["Photo"] as! String
                
                let data = self.postphoto.image?.jpegData(compressionQuality: 0.7)
                let imageReference = Storage.storage().reference().child((Auth.auth().currentUser?.email)!).child("\(String(describing: Auth.auth().currentUser?.email)) profile Image")
                imageReference.putData(data!, metadata: nil) { (meta, error2) in
                    imageReference.downloadURL { (url, error) in
                        self.handwithdatabase(name: name, userImage: photo , Age: Age, City: city, pincode: pincode, k: url!.absoluteString)
                        
                      
                    }
                }
            }
        }
        
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "tofinal", sender: self)
            
        }
        
        
        
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}


extension FeedInputViewController : UIImagePickerControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else {
            return
        }
        
        dismiss(animated: true)
        postphoto.image = image
    }
    
    
}
