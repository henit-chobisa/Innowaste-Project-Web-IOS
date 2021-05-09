//
//  socialFeedViewController.swift
//  TeamRash_InnoWaste
//
//  Created by Henit Work on 11/04/21.
//

import UIKit
import Firebase
import Kingfisher

class socialFeedViewController: UIViewController {

    var feedData : [FeedBoxData] = []
    @IBOutlet weak var feedTableView: UITableView!
    let db = Firestore.firestore()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        
        feedTableView.dataSource = self
        feedTableView.register(UINib(nibName: "feedBoxTableViewCell", bundle: nil), forCellReuseIdentifier: "feedcell")
        feedTableView.rowHeight = 290
    
    }
    
    func loadData(){
        
        feedData = []
        
        db.collection("PostCollection").addSnapshotListener { (query, error) in
            let doc = query?.documents
            for data in doc! {
                if let email = data["Email"] as? String , let name = data["UserName"] as? String , let city = data["City"] as? String , let userImage = data["userImage"] as? String ,let challenge_photo = data["challenge_photo"] as? String{
                    let box = FeedBoxData(userName: name , userEmail: email, userPlace: city, userImage: userImage, challenge_name: "Scooter-Less", challenge_des: "Leave your vehicle for half destinations, get a medal with 3 points", postPhoto: challenge_photo)
                    self.feedData.append(box)
                }
                
                
                DispatchQueue.main.async {
                    self.feedTableView.reloadData()
                }
            }
            
            
            
            
            
        }
        
    }
    
    

}

extension socialFeedViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = feedTableView.dequeueReusableCell(withIdentifier: "feedcell", for: indexPath) as! feedBoxTableViewCell
        cell.userName.text = feedData[indexPath.row].userName
        cell.userEmail.text = feedData[indexPath.row].userEmail
        cell.userPlace.text = feedData[indexPath.row].userPlace
        cell.postName.text = feedData[indexPath.row].challenge_name
        cell.postDes.text = feedData[indexPath.row].challenge_des
        let userpic = feedData[indexPath.row].userImage
        let url = URL.init(string: userpic)
        let imageresourse = ImageResource.init(downloadURL: url!)
        cell.userImage.kf.setImage(with: imageresourse) { (result) in
           print("Success")
        }
        let postpic = feedData[indexPath.row].postPhoto
        let url2 = URL.init(string: postpic)
        let imageresource2 = ImageResource.init(downloadURL: url2!)
        cell.postImage.kf.setImage(with: imageresource2){
            (result2) in
            print("success2")
        }
        
        return cell
    }
    
}
