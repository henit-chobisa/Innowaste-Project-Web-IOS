//
//  trashcallViewController.swift
//  TeamRash_InnoWaste
//
//  Created by Henit Work on 11/04/21.
//

import UIKit
import Firebase
import FirebaseFirestore
import Lottie


class trashcallViewController: UIViewController {
    var db = Firestore.firestore()
    
    @IBOutlet weak var lotanim: AnimationView!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var pincodeFeild: UITextField!
    @IBOutlet weak var segmentor: UISegmentedControl!
    @IBOutlet weak var addressfeild: UITextField!
    @IBOutlet weak var sliderval: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        lotanim.contentMode = .scaleAspectFit
        lotanim.loopMode = .loop
        DispatchQueue.main.async {
            self.lotanim.play()
        }
        
        addressfeild.layer.cornerRadius = 15
        pincodeFeild.layer.cornerRadius = 15
        submitButton.layer.cornerRadius = 20
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitPressed(_ sender: UIButton) {
        db.collection("Collection Orders").addDocument(data: ["Type" :segmentor.titleForSegment(at: segmentor.selectedSegmentIndex)! , "Quantity" : sliderval.text! , "Address" : addressfeild.text! , "pincode" : pincodeFeild.text! ])
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "done", sender: self)
        }
        
        
    }
    
    @IBAction func backHit(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    
    
    
    @IBAction func valuechanged(_ sender: UISlider) {
        let val = "\(sender.value) kg"
        sliderval.text = val
        
    }
    


}
