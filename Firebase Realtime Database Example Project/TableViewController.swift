//
//  TableViewController.swift
//  Firebase Realtime Database Example Project
//
//  Created by Zulwiyoza Putra on 2/1/17.
//  Copyright © 2017 zulwiyozaputra. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class TableViewController: UITableViewController {
    
    
    var posts = [Post]()
    
    func post() -> Void {
        let title = "Title"
        let message = "Message"
        
        let post: [String: Any] = ["title": title, "message": message]
        
        let databaseReference = FIRDatabase.database().reference()
        
        databaseReference.child("post").childByAutoId().setValue(post)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let databaseReference = FIRDatabase.database().reference()
        
        databaseReference.child("post").queryOrderedByKey().observe(.childAdded, with: { (databaseSnapshot) in
            guard let snapshotValue = databaseSnapshot.value as? NSDictionary else {
                print("There was no value returned in value of databse snapshot")
                return
            }
            let title = snapshotValue["title"] as! String
            let message = snapshotValue["message"] as! String
            
            self.posts.insert(Post(title: title, message: message), at: 0)
            self.tableView.reloadData()
        })
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return posts.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell

        cell.titleLabel.text = posts[indexPath.row].title
        cell.messageLabel.text = posts[indexPath.row].message

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
