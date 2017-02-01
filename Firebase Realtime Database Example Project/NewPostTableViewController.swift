//
//  NewPostTableViewController.swift
//  Firebase Realtime Database Example Project
//
//  Created by Zulwiyoza Putra on 2/1/17.
//  Copyright © 2017 zulwiyozaputra. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class NewPostTableViewController: UITableViewController {

    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var messageTextField: UITextField!
    
    @IBAction func cancelButton(_ sender: Any) {
        
        showAlert(singleOption: true, title: "Discard Post?", message: "Are you sure you want to discard your post?")
        
        
        
        
    }
    
    @IBAction func saveButton(_ sender: Any) {
        showAlert(singleOption: false, title: "Save Post", message: "Are you sure you want to save your post?")
    }
    
    private func savePost() -> Void {
        if titleTextField.text != nil && messageTextField.text != nil {
            post()
        } else {
            print("There was no value to post")
        }
    }
    
    private func post() -> Void {
        let post: [String: Any] = ["title": titleTextField.text!, "message": messageTextField.text!]
        
        let databaseReference = FIRDatabase.database().reference()
        
        databaseReference.child("post").childByAutoId().setValue(post)
    }
    
    private func showAlert(singleOption: Bool, title: String, message: String) -> Void {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        if singleOption == true {
            
            let dismiss = UIAlertAction(title: "Dismiss", style: .destructive) { (alert: UIAlertAction!) in
                print("user dismissed")
                self.dismiss(animated: true, completion: nil)
            }
            
            alert.addAction(dismiss)
        } else {
            
            let cancel = UIAlertAction(title: "Cancel", style: .destructive) { (alert: UIAlertAction!) in
                print("user tapped cancel")
            }
            
            let ok = UIAlertAction(title: "Ok", style: .default) { (alert: UIAlertAction!) in
                print("user tapped OK")
                self.savePost()
                self.dismiss(animated: true, completion: nil)
            }

            alert.addAction(cancel)
            alert.addAction(ok)
        }
        
        
        present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
