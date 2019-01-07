//
//  MasterViewController.swift
//  iOS5-Vorgabe
//
//  Created by Klaus Jung on 07.12.18.
//  Copyright © 2018 Klaus Jung. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
    
    
    
    var objects = [AddressCard]()
    let testCard1 = AddressCard.init(vorname: "Louis", nachname: "Ohlow", straße: "Runguisstraße 32", plz: 12347, ort: "Berlin")
    let testCard2 = AddressCard.init(vorname: "Jan", nachname: "Driescher", straße: "Frankfurter Allee 269", plz: 12347, ort: "Berlin")
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.leftBarButtonItem = editButtonItem
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
        
        navigationItem.rightBarButtonItem = addButton
        
        if let del = UIApplication.shared.delegate as? AppDelegate{
            objects = del.book.addressCards
        }
        
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let del = UIApplication.shared.delegate as? AppDelegate{
            objects = del.book.addressCards
        }
        
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back(_ segue: UIStoryboardSegue){
        
    }
    
    
    @objc
    func insertNewObject(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "addContact") as! UIViewController
        self.present(vc, animated: true, completion: nil)
    }
    
    // MARK: - Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? DetailViewController {
            if let indexPath = tableView.indexPathForSelectedRow {
                controller.detailItem = objects[indexPath.row]
            }   
        }
    }
    
    // MARK: - Table View
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = objects[indexPath.row].vorname + " " + objects[indexPath.row].nachname
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            objects.remove(at: indexPath.row)
            if let del = UIApplication.shared.delegate as? AppDelegate{
                del.book.remove(_card: del.book.addressCards[indexPath.row])
            }
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
}

