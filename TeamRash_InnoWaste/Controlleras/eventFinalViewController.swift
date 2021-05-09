//
//  eventFinalViewController.swift
//  TeamRash_InnoWaste
//
//  Created by Henit Work on 11/04/21.
//

import UIKit
import Lottie

class eventFinalViewController: UIViewController {
    @IBOutlet weak var animation: AnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animation.contentMode = .scaleAspectFit
        animation.loopMode = .playOnce
        
        DispatchQueue.main.async {
            self.animation.play()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 8) {
            self.dismiss(animated: true)
        }
        

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
