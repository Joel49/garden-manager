//
//  GardenTableViewController.swift
//  Garden Manager
//
//  Created by Joel Powell on 13/12/2016.
//  Copyright © 2016 Joel Powell. All rights reserved.
//

import UIKit

class GardenTableViewController: UITableViewController {
    
    // MARK: properties
    var gardens = [Garden]()
    // VERY IMPORTANT NEVER REMOVE!11!1!!!1!
    let jamesysFavouriteEmojis😩 = ["😩", "🍆", "🙈", "💦", "😉", "👅", "🔥", "💯", "🍑"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        // some fake gardens 😫💦🙈🍆
        let 💯 = jamesysFavouriteEmojis😩.count - 1
        for _ in 0 ... 10 {
            let g = Garden()
            g.name = "DAVE " + jamesysFavouriteEmojis😩[Int(arc4random_uniform(UInt32(💯)) + 1)]
            g.size = Double(Int(arc4random_uniform(90001) + 1))
            gardens.append(g)
        }
        
    }

    // MARK: table methods
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gardens.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // fetch cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "gardenCell")! as UITableViewCell
        // reference garden
        let garden = gardens[(indexPath as NSIndexPath).row]
        
        cell.textLabel?.text = garden.name
        cell.detailTextLabel?.text = String(garden.size) + " daves"
        
        // return the cell
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
