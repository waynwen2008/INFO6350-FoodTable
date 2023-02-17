//
//  ViewController.swift
//  FoodTableViewController
//
//  Created by Wayne Wen on 2/16/23.
//

import UIKit

struct RestaurantMenu {
    let restaurant: String
    let foodItems: [String]
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var curRestaurant: String = ""
    var curFoodItems: [String] = []
    
    let restaurantMenu: [RestaurantMenu] = [
        RestaurantMenu(restaurant: "Pies N' Thighs", foodItems: ["Cream Pie", "Custard Pie", "Meringue Pie", "Chiffon Pie"]),
        RestaurantMenu(restaurant: "Backyard Bowls", foodItems: ["Shrimp and Bean Burrito Bowl", "Whole-Grain Veggie Burrito Bowl", "Quinoa Bibimbop Bowls", "Carne Asada Bowls", "Chicken Gyro Bowls"]),
        RestaurantMenu(restaurant: "Mellow Mushroom", foodItems: ["Mushroom Stroganoff", "Caprese Stuffed Portobello Mushrooms", "Southern Braised Chicken with Mushrooms and Black Eyed Peas"]),
        RestaurantMenu(restaurant: "Wicked Wok", foodItems: ["Beef and Broccoli", "Dan Dan Noodles", "Vegetable Stir-Fry", "Yakisoba Chicken", "Garlic Shrimp Stir-fry"]),
        RestaurantMenu(restaurant: "Chops and Hops", foodItems: ["Alinazik kebab", "Aloo gosht", "Arrosticini", "Bakhsh", "Chanakhi", "Colonial goose"]),
        RestaurantMenu(restaurant: "Yummy In The Tummy", foodItems: ["Beef Wellington", "Onion soup", "Peking duck", "Shakshuka", "Laksa"]),
        RestaurantMenu(restaurant: "Slice of Spice", foodItems: ["Kaali Mirch", "Laal Mirch", "Haldi", "Tej Patta", "Kesar", "Methi Dana"]),
    ]

    
    @IBOutlet weak var foodTblView: UITableView!
    @IBOutlet weak var restaurantTblView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restaurantTblView.delegate = self
        restaurantTblView.dataSource = self
        foodTblView.delegate = self
        foodTblView.dataSource = self
        foodTblView.isHidden = true
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numberOfRow = 1
        switch tableView {
            case restaurantTblView :
                numberOfRow = restaurantMenu.count
            case foodTblView :
                numberOfRow = curFoodItems.count
            default:
                print("Something went wrong!")
        }
        
        return numberOfRow
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        switch tableView {
            case restaurantTblView :
                cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                cell.textLabel?.text = restaurantMenu[indexPath.row].restaurant
            case foodTblView :
                cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                cell.textLabel?.text = curFoodItems[indexPath.row]
            default:
                print("Something went wrong!")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch tableView {
            case restaurantTblView :
                print("you click restauant at \(restaurantMenu[indexPath.row].restaurant)")
                foodTblView.isHidden = false
                curRestaurant = restaurantMenu[indexPath.row].restaurant
                curFoodItems = restaurantMenu[indexPath.row].foodItems
                foodTblView.reloadData()
            case foodTblView :
                print("you click food at \(curFoodItems[indexPath.item])")
            default:
                print("Something went wrong!")
        }
    }
}

