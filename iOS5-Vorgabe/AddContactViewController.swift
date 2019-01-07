//
//  AddContactViewController.swift
//  iOS5-Vorgabe
//
//  Created by Jan Driescher on 03.01.19.
//  Copyright © 2019 Klaus Jung. All rights reserved.
//
import Foundation
import UIKit

class AddContactViewController: UIViewController{
    
    
    @IBOutlet weak var vorname: UITextField!
    @IBOutlet weak var nachname: UITextField!
    @IBOutlet weak var straße: UITextField!
    @IBOutlet weak var plz: UITextField!
    @IBOutlet weak var ort: UITextField!
    
    @IBAction func submit(_ sender: Any) {
        let card = AddressCard.init(vorname: vorname.text ?? "", nachname: nachname.text ?? "", straße: straße.text ?? "", plz: Int(plz.text ?? "") ?? 0, ort: ort.text ?? "")
        if let del = UIApplication.shared.delegate as? AppDelegate{
            del.book.add(card: card)
            del.book.sort()
        }
    }
    
}
