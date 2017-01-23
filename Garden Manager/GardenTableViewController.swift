//
//  GardenTableViewController.swift
//  Garden Manager
//
//  Created by Joel Powell on 13/12/2016.
//  Copyright © 2016 Joel Powell. All rights reserved.
//

import UIKit
import RealmSwift
import Foundation


class GardenTableViewController: UITableViewController {
    
    // MARK: properties
    var gardens = [Garden]()
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        // load Gardens from Realm
        gardens = Array(realm.objects(Garden.self))
        
        // print realm path to console
        //print(Realm.Configuration.defaultConfiguration.fileURL!)
    }

    
    
    @IBAction func addGarden(_ sender: UIBarButtonItem) {
        
        let addGardenAlert = UIAlertController(title: "New Garden", message: "Enter a name for this garden.", preferredStyle: UIAlertControllerStyle.alert)
        
        addGardenAlert.addTextField { (textField) in
            
        }
        
        addGardenAlert.addAction(UIAlertAction(title: "Save", style: .default, handler: { (action) in
            
            let newGardenName = addGardenAlert.textFields![0] as UITextField
            
            // enter to local array
            let newGarden = Garden()
            newGarden.name = newGardenName.text!
            newGarden.id = UUID().uuidString
            self.gardens.append(newGarden)
            
            // now add to Realm
            try! self.realm.write {
                self.realm.add(newGarden)
            }
            
            // refresh table
            self.tableView.reloadData()
            
        }))
        
        addGardenAlert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (action) in
            
            self.dismiss(animated: true, completion: nil)
            
        }))
        
        self.present(addGardenAlert, animated: true, completion: nil)
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
        
        let garden = gardens[(indexPath).row]
        
        cell.textLabel?.text = garden.name
        
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

    
    // enable garden deleting
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {

            // delete the row from realm
            try! self.realm.write {
                self.realm.delete(gardens[(indexPath).row])
            }
            
            // delete from local array
            self.gardens.remove(at: (indexPath).row)
            
            // refresh table
            self.tableView.reloadData()
            
        //} else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
    // This function is called before the segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // get a reference to the second view controller
        let secondViewController = segue.destination as! TabBarViewController
        
        // set a variable in the second view controller with the data to pass
        let indexPath = self.tableView.indexPathForSelectedRow!
        
        secondViewController.currentGarden = gardens[(indexPath).row]
    }
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
    }

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
