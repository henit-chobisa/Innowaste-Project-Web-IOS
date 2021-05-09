//
//  ViewController.swift
//  TeamRash_InnoWaste
//
//  Created by Henit Work on 10/04/21.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    @IBOutlet weak var signAnimation: AnimationView!
    @IBOutlet weak var animationView2: AnimationView!
    @IBOutlet weak var animationView1: AnimationView!
    @IBOutlet weak var joinButton: UIButton!
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        joinButton.layer.cornerRadius = 20
        signAnimation.isHidden = true
        animationView1.contentMode = .scaleAspectFit
        animationView2.contentMode = .scaleAspectFit
        animationView2.loopMode = .loop
        animationView1.loopMode = .loop
        animationView2.play()
        animationView1.play()
        modalPresentationCapturesStatusBarAppearance = true
        animationView2.backgroundColor = .clear
        animationView1.backgroundColor = .clear
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func joinButtonHit(_ sender: UIButton) {
        animationView2.isHidden = true
        animationView1.isHidden = true
        signAnimation.isHidden = false
        signAnimation.contentMode = .scaleAspectFit
        signAnimation.loopMode = .loop
        signAnimation.play()
        signAnimation.backgroundColor = .clear
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.performSegue(withIdentifier:"tosignIn" , sender: self)
        }
        
    }
    


}

