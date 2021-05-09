//
//  EventAskingViewController.swift
//  TeamRash_InnoWaste
//
//  Created by Henit Work on 11/04/21.
//

import UIKit
import Lottie
import Firebase

class EventAskingViewController: UIViewController {

    let db = Firestore.firestore()
    @IBOutlet weak var sumbitbutton: UIButton!
    @IBOutlet weak var pincodefield: UITextField!
    @IBOutlet weak var addressfeild: UITextField!
    @IBOutlet weak var datefeild: UITextField!
    @IBOutlet weak var namefeild: UITextField!
    @IBOutlet weak var lottieanim: AnimationView!
    override func viewDidLoad() {
        super.viewDidLoad()
        lottieanim.loopMode = .loop
        lottieanim.contentMode = .scaleAspectFit
        pincodefield.layer.cornerRadius = 15
        addressfeild.layer.cornerRadius = 15
        datefeild.layer.cornerRadius = 15
        namefeild.layer.cornerRadius = 15
        sumbitbutton.layer.cornerRadius = 20
        
        DispatchQueue.main.async {
            self.lottieanim.play()
        }

        // Do any additional setup after loading the view.
    }
    
    @IBAction func submithitted(_ sender: UIButton) {
        db.collection("Events").addDocument(data : ["Name" : namefeild.text! , "date" : datefeild.text! , "address" : addressfeild.text! , "pincode" : pincodefield.text!])
        
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "toload", sender: self)
        }
        
    }
    
    @IBAction func back(_ sender: UIButton) {
        self.dismiss(animated: true)
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
