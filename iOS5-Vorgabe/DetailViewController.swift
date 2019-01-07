//
//  DetailViewController.swift
//  iOS5-Vorgabe
//
//  Created by Klaus Jung on 07.12.18.
//  Copyright © 2018 Klaus Jung. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController {
    
    var detailItem = AddressCard()
    var infoList = [(String,String)]()
    
    func configureView() {
        // Update the user interface for the detail item.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        helper.card = detailItem
        infoList.append(("Vorname", detailItem.vorname))
        infoList.append(("Nachname", detailItem.nachname))
        infoList.append(("Straße", detailItem.straße))
        infoList.append(("PLZ", String(detailItem.plz)))
        infoList.append(("Ort", detailItem.ort))
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        // Do any additional setup after loading the view, typically from a nib.
        let editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editObject(_:)))
        navigationItem.rightBarButtonItem = editButton
        configureView()
    }
    
    
    
    @objc
    func editObject(_ sender: Any) {
        print("editObject")
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "editCard") as! UIViewController
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func back2(_ segue: UIStoryboardSegue){
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table View
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = infoList[indexPath.row].0
        cell.detailTextLabel?.text = infoList[indexPath.row].1
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
}

