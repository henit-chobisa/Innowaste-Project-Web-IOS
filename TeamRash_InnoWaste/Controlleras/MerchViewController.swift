//
//  MerchViewController.swift
//  TeamRash_InnoWaste
//
//  Created by Henit Work on 11/04/21.
//

import UIKit
import Lottie
import iCarousel
import AVFoundation

class MerchViewController: UIViewController {
    
  
    let labels : [String] = ["", "5 PM" , "A d d i d a s", "I I S E","", "K V E L L","H & M"]
    let descriptions : [String] = ["Black's clothing 80% environment-friendly recyclable cotton." , "Latest collection by 5PM with 0% plastic usage" , "Addidas's shoe collection made from 100% ecofriendly material", " Prestigious collections from IISE with 10 times reusable cotton" , "Promotional collections from H&M for the upcomming MAMAEarth Event","KVELL's clothing 80% environment-friendly recyclable cotton."]
    
    @IBOutlet weak var mycarousel: iCarousel!
    @IBOutlet weak var backgroundAnimation: AnimationView!
    @IBOutlet weak var videoTitle: UILabel!
    @IBOutlet weak var videoDescription: UILabel!
    
    
    override func viewWillAppear(_ animated: Bool) {
        mycarousel.type = .coverFlow
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundAnimation.contentMode = .scaleToFill
        backgroundAnimation.loopMode = .loop
        backgroundAnimation.backgroundColor = .clear
        mycarousel.dataSource = self
        mycarousel.delegate = self
        
        mycarousel.currentItemIndex = 2
        
        Timer.scheduledTimer(timeInterval: 47.00, target: self, selector: #selector(repetation), userInfo: nil, repeats: true)
        
        
      
        
        DispatchQueue.main.async {
            self.backgroundAnimation.play()
        }
        
    }
    
    @objc func repetation(){
        mycarousel.reloadData()
    }
}

extension MerchViewController : iCarouselDelegate{
    func carouselCurrentItemIndexDidChange(_ carousel: iCarousel) {
        let index = carousel.currentItemIndex
        videoTitle.text = labels[index]
        videoDescription.text = descriptions[index]
    }
}

extension MerchViewController : iCarouselDataSource{
    func numberOfItems(in carousel: iCarousel) -> Int {
        return 6
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {

        let view = UIView(frame: CGRect(x: 0, y: 0, width: 364, height: 230))
        let videoString:String? = Bundle.main.path(forResource: "\(index+1)", ofType: "mp4")
        let unwrappedVideoPath = videoString
        videoTitle.text = "A d d i d a s"
        videoDescription.text = "Addidas's shoe collection made from 100% ecofriendly material"
        let videoUrl = URL(fileURLWithPath: unwrappedVideoPath!)
        let player = AVPlayer(url: videoUrl)
        let layer: AVPlayerLayer = AVPlayerLayer(player: player)
        layer.frame = view.bounds
        layer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        view.layer.addSublayer(layer)
        view.layer.cornerRadius = 20
        player.isMuted = true
        player.play()
        
        return view
    }
    
    
}


