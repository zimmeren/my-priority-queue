//
//  YourQueueTableViewCell.swift
//  mypriorityqueue
//
//  Created by Austin Zimmer on 6/17/17.
//  Copyright © 2017 Austin Zimmer. All rights reserved.
//

import UIKit

class YourQueueTableViewCell: UITableViewCell {

    @IBOutlet var TitleLabel: UILabel!
    
    @IBOutlet var DateLabel: UILabel!
    
    @IBOutlet var DescriptionLabel: UILabel!
    
    let dateFormatter = DateFormatter()
    
    public func updateCell(data : Item) {
        TitleLabel.text = data.title
        
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        let date = dateFormatter.date(from: data.date)
        dateFormatter.dateFormat = "MM/dd/yyyy"
        DateLabel.text = dateFormatter.string(from: date!)
        DescriptionLabel.text = data.details
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
