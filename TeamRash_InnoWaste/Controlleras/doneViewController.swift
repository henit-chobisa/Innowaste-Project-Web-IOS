//
//  doneViewController.swift
//  TeamRash_InnoWaste
//
//  Created by Henit Work on 10/04/21.
//

import UIKit
import Lottie

class doneViewController: UIViewController {

    @IBOutlet weak var mainAnimationView: AnimationView!
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainAnimationView.contentMode = .scaleAspectFit
        mainAnimationView.loopMode = .playOnce
        DispatchQueue.main.async {
            self.mainAnimationView.play()
        }
        modalPresentationCapturesStatusBarAppearance = true
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
