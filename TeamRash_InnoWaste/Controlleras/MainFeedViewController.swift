//
//  MainFeedViewController.swift
//  TeamRash_InnoWaste
//
//  Created by Henit Work on 10/04/21.
//

import UIKit
import Lottie
import iCarousel


class MainFeedViewController: UIViewController {
    
    let images : [UIImage] = [#imageLiteral(resourceName: "Marathon"), #imageLiteral(resourceName: "Beach") ,#imageLiteral(resourceName: "Leaf"), #imageLiteral(resourceName: "Traffic"), #imageLiteral(resourceName: "Park")]

    
    @IBOutlet weak var eventDescriptionLabel: UILabel!
    let events : [EventDetails] = [EventDetails(EventName: "Eco-Marathon", Description: "Marathon for Mother Earth - 2 days ", image: #imageLiteral(resourceName: "372-3726798_gold-medal-png-gold-medal-clipart-png")) , EventDetails(EventName: "Earthlings", Description: "Community Beach Cleaning - 15 days", image: #imageLiteral(resourceName: "Winner-Ribbon-PNG-Image")),EventDetails(EventName: "Mama Earth", Description: "A campaign against plastic and deforestation and promoting the three R's", image:#imageLiteral(resourceName: "372-3726798_gold-medal-png-gold-medal-clipart-png")) , EventDetails(EventName: "NoFuel", Description: "No Fuel challenge - 30days", image: #imageLiteral(resourceName: "Winner-Ribbon-PNG-Image")) , EventDetails(EventName: "Clean Me", Description: "Clean the nearest park with your friends", image: #imageLiteral(resourceName: "372-3726798_gold-medal-png-gold-medal-clipart-png"))]
   
    
    @IBOutlet weak var medalView: UIImageView!
    @IBOutlet weak var eventHeadingLabel: UILabel!
    @IBOutlet weak var carouselView: iCarousel!
    @IBOutlet weak var coinAnimation: AnimationView!
    @IBOutlet weak var challengesView: AnimationView!
    
    @IBOutlet weak var askEventView: AnimationView!
    @IBOutlet weak var askpickupView: AnimationView!
    
    override func viewWillAppear(_ animated: Bool) {
        carouselView.type = .coverFlow
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        carouselView.dataSource = self
        carouselView.delegate = self
       
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.carouselView.currentItemIndex = 2
        }
        
        
        challengesView.contentMode = .scaleAspectFit
        challengesView.backgroundColor = .clear
        challengesView.loopMode = .loop
        
        coinAnimation.contentMode = .scaleAspectFill
        coinAnimation.backgroundColor = .clear
        coinAnimation.loopMode = .loop
        coinAnimation.play()
        
        askEventView.contentMode = .scaleAspectFit
        askEventView.backgroundColor = .clear
        askEventView.loopMode = .loop
        
        askpickupView.contentMode = .scaleAspectFit
        askpickupView.backgroundColor = .clear
        askpickupView.loopMode = .loop
        
        DispatchQueue.main.async {
            self.challengesView.play()
            self.askEventView.play()
            self.askpickupView.play()
        }

    }
    
    @IBAction func challengesButtonHit(_ sender: UIButton) {
        self.performSegue(withIdentifier: "askChallenge", sender: self)
    }
    
    @IBAction func pickupButtonHit(_ sender: UIButton) {
        self.performSegue(withIdentifier: "askPickup", sender: self)
    }
    
    @IBAction func eventAsked(_ sender: UIButton) {
        self.performSegue(withIdentifier: "askEvent", sender: self)
    }
}

extension MainFeedViewController : iCarouselDelegate{
    func carouselCurrentItemIndexDidChange(_ carousel: iCarousel) {
        let index = carousel.currentItemIndex
        eventHeadingLabel.text = events[index].EventName
        eventDescriptionLabel.text = events[index].Description
        medalView.image = events[index].image
    }
    
}

extension MainFeedViewController : iCarouselDataSource{
    func numberOfItems(in carousel: iCarousel) -> Int {
        return images.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 293, height: 479))
        let myimage = UIImageView(frame: view.bounds)
        myimage.image = images[index]
        view.addSubview(myimage)
        
        myimage.contentMode = .scaleToFill
        
        
        return view
    }
    
}


