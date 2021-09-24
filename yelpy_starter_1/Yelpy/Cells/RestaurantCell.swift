//
//  RestaurantCell.swift
//  Yelpy
//
//  Created by Desmond Ofori Atta on 9/24/21.
//  Copyright © 2021 memo. All rights reserved.
//

import UIKit

class RestaurantCell: UITableViewCell {

    @IBOutlet weak var isOpen: UILabel!
    @IBOutlet weak var restaurantImage: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var contact: UILabel!
    @IBOutlet weak var review_image: UIImageView!
    @IBOutlet weak var total_reviews: UILabel!
    @IBOutlet weak var type: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
