//
//  BingoViewController.swift
//  TeamRash_InnoWaste
//
//  Created by Henit Work on 10/04/21.
//

import UIKit
import Lottie

class BingoViewController: UIViewController {

   
    @IBOutlet weak var loadTick: AnimationView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTick.contentMode = .scaleAspectFit
        loadTick.loopMode = .playOnce
        DispatchQueue.main.async {
            self.loadTick.play()
        }
       
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(  segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
