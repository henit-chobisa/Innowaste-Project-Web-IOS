//
//  feedBoxTableViewCell.swift
//  TeamRash_InnoWaste
//
//  Created by Henit Work on 11/04/21.
//

import UIKit

class feedBoxTableViewCell: UITableViewCell {

    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var postDes: UILabel!
    @IBOutlet weak var postName: UILabel!
    @IBOutlet weak var userPlace: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contentView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
