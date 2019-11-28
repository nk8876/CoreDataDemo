//
//  TableViewCell.swift
//  CoreDataDemo
//
//  Created by Dheeraj Arora on 19/07/19.
//  Copyright © 2019 Dheeraj Arora. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblMobile: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    var student:Student!{
        didSet{
            lblName.text = student.name
            lblMobile.text = student.mobile
            lblAddress.text = student.attribute1
            lblCity.text = student.city

        }
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
