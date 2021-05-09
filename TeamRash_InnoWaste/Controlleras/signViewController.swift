//
//  signViewController.swift
//  TeamRash_InnoWaste
//
//  Created by Henit Work on 10/04/21.
//

import UIKit
import Lottie
import FirebaseAuth
import Canvas

class signViewController: UIViewController {

    @IBOutlet weak var segmentor: UISegmentedControl!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var signUpBackground: AnimationView!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var passwordtextfeilfd: UITextField!
    @IBOutlet weak var emailtextfeild: UITextField!
    @IBOutlet weak var frameAnimationView: CSAnimationView!
    @IBOutlet weak var penAnimation: AnimationView!
    override var prefersStatusBarHidden: Bool {
        return true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        penAnimation.contentMode = .scaleAspectFit
        penAnimation.backgroundColor = .clear
        signUpBackground.backgroundColor = .clear
        signUpBackground.contentMode = .scaleToFill
        modalPresentationCapturesStatusBarAppearance = true
        frameAnimationView.type = "zoomOut"
        frameAnimationView.duration = 1.5
        frameAnimationView.delay = 0
        emailtextfeild.layer.cornerRadius = 15
        passwordtextfeilfd.layer.cornerRadius = 15
        signInButton.layer.cornerRadius = 20
        penAnimation.loopMode = .loop
        DispatchQueue.main.async {
            self.frameAnimationView.startCanvasAnimation()
            self.penAnimation.play()
            self.signUpBackground.play()
        }
    }
    
    @IBAction func signInButton(_ sender: UIButton) {
        if segmentor.selectedSegmentIndex == 0
        {
            Auth.auth().signIn(withEmail: emailtextfeild.text!, password: passwordtextfeilfd.text!) { (result, error) in
                if error == nil {
                    self.performSegue(withIdentifier: "fromlogintomain", sender: self)
                    
                }
            }
        }
        
        else {
            Auth.auth().createUser(withEmail: emailtextfeild.text!, password: passwordtextfeilfd.text!) { (result, error) in
                if error == nil {
                    self.performSegue(withIdentifier: "toregister", sender: self)
                    
                    
                }
            }
        }
        
    }
    
    
    @IBAction func segmentor(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            topLabel.text = "L O G I N"
            signInButton.setTitle("SignIn Now", for: .normal)
        }
        else if sender.selectedSegmentIndex == 1 {
            topLabel.text = "R E G I S T E R"
            signInButton.setTitle("Register Now", for: .normal)
        }
    }
    
   

}
