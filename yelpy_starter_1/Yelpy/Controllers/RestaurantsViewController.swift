//
//  ViewController.swift
//  Yelpy
//
//  Created by Memo on 5/21/20.
//  Copyright © 2020 memo. All rights reserved.
//

import UIKit
import AlamofireImage

class RestaurantsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var restaurantsArray : [[String:Any]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 150
        getAPI()
    }
    
    func getAPI(){
        API.getRestaurants(){(restaurants) in
            guard let restaurants = restaurants else {return}
            self.restaurantsArray = restaurants
            self.tableView.reloadData()
        }

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell") as! RestaurantCell
        
        let restaurant = restaurantsArray[indexPath.row]
        
        cell.label.text = restaurant["name"] as? String
        cell.contact.text = restaurant["phone"] as? String
        
        let reviewCount = restaurant["review_count"] as! Int
        cell.total_reviews.text = String(reviewCount)
    
        let categories = restaurant["categories"] as? [[String: String]]
        cell.type.text = ""
        for category in categories ?? []{
            cell.type.text! += category["title"] ?? ""
            cell.type.text! += ", "
        }
        
        let images = [
            0 : "regular_0" ,
            0.5 : "regular_0",
            1 : "regular_1",
            1.5 : "regular_1_half",
            2 : "regular_2",
            2.5 : "regular_2_half",
            3 : "regular_3",
            3.5 : "regular_3_half",
            4 : "regular_4",
            4.5 : "regular_4_half",
            5 : "regular_5"
        ]
        
        let ratings = restaurant["rating"] as! Double
        cell.review_image.image = UIImage(imageLiteralResourceName: images[ratings] ?? "")
        
        if let imageUrlString = restaurant["image_url"] as? String{
            let imageUrl = URL(string: imageUrlString)!
            cell.restaurantImage.af.setImage(withURL: imageUrl)
        }
        
        let is_open = restaurant["is_closed"] as? Bool
        if is_open == true {
            cell.isOpen.text = "Open"
            cell.isOpen.textColor = UIColor.systemGreen
        }
        else{
            cell.isOpen.text = "Closed"
            cell.isOpen.textColor = UIColor.systemRed
        }
        
        return cell
    }
}

// ––––– TODO: Create tableView Extension and TableView Functionality


