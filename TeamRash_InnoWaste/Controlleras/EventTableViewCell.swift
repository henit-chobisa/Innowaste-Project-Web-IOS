//
//  EventTableViewCell.swift
//  TeamRash_InnoWaste
//
//  Created by Henit Work on 11/04/21.
//

import UIKit

class EventTableViewCell: UITableViewCell {

    @IBOutlet weak var eventDescription: UILabel!
    @IBOutlet weak var EventName: UILabel!
    @IBOutlet weak var eventImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        eventImage.clipsToBounds = true
        eventImage.layer.cornerRadius = 5
        contentView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
