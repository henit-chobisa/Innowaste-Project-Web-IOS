//
//  ChallengeViewController.swift
//  TeamRash_InnoWaste
//
//  Created by Henit Work on 11/04/21.
//

import UIKit
import Lottie

class ChallengeViewController: UIViewController {
    let events : [EventDetails] = [EventDetails(EventName: "Park Clean", Description: "Clean Nearest Park and upload photo,get medal with 5 points", image: #imageLiteral(resourceName: "medal-transparent-background-15")) , EventDetails(EventName: "ScooterLess", Description: "Leave your vehicle for half destinations, get a medal with 3 points", image: #imageLiteral(resourceName: "Winner-Ribbon-PNG-Image")) , EventDetails(EventName: "Clean Campaign", Description: "Motivate people to clean the nearest beach , clean with them and earn 40 points", image: #imageLiteral(resourceName: "372-3726798_gold-medal-png-gold-medal-clipart-png")) , EventDetails(EventName: "Teach Environment", Description: "Clean the nearest school with students to encourage them to not pollute - 50 points", image: #imageLiteral(resourceName: "medal-transparent-background-15")) , EventDetails(EventName: "Make posters", Description: "Circulate posters fro electricity conservation-50 points", image: #imageLiteral(resourceName: "Winner-Ribbon-PNG-Image")),EventDetails(EventName: "Make posters", Description: "Circulate posters fro electricity conservation-50 points", image: #imageLiteral(resourceName: "Winner-Ribbon-PNG-Image")),EventDetails(EventName: "Park Clean", Description: "Clean Nearest Park and upload photo,get medal with 5 points", image: #imageLiteral(resourceName: "medal-transparent-background-15")) ]

    @IBOutlet weak var eventTableview: UITableView!
    @IBOutlet weak var topAnimation: AnimationView!
    override func viewDidLoad() {
        super.viewDidLoad()
        topAnimation.contentMode = .scaleAspectFit
        topAnimation.loopMode = .loop
        topAnimation.backgroundColor = .clear
        eventTableview.dataSource = self
        DispatchQueue.main.async {
            self.topAnimation.play()
        }
        eventTableview.register(UINib.init(nibName: "EventTableViewCell", bundle: nil), forCellReuseIdentifier:"eventCell" )
        eventTableview.rowHeight = 70
        eventTableview.allowsSelection = true
        eventTableview.delegate = self
        

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func backHit(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    

}

extension ChallengeViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = eventTableview.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as! EventTableViewCell
        cell.EventName.text = events[indexPath.row].EventName
        cell.eventDescription.text = events[indexPath.row].Description
        cell.eventImage.image = events[indexPath.row].image
        return cell
    }
    
    
}

extension ChallengeViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toupload", sender: self)
    }
    
}
