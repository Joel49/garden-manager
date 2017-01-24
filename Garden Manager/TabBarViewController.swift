//
//  TabBarViewController.swift
//  Garden Manager
//
//  Created by Joel Powell on 23/01/2017.
//  Copyright © 2017 Joel Powell. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    var currentGarden:Garden?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // display modalahy modal
        present(GardenTableViewController(), animated: true, completion: nil)
        
        
        // Do any additional setup after loading the view
        
        //self.navigationItem.prompt = currentGarden!.name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
