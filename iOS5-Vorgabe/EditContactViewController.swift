//
//  EditContactViewController.swift
//  iOS5-Vorgabe
//
//  Created by Jan Driescher on 03.01.19.
//  Copyright © 2019 Klaus Jung. All rights reserved.
//

import Foundation
import UIKit

class EditContactViewController: UIViewController, UITextFieldDelegate{
    
    var editItem = helper.card
    
    
    @IBOutlet weak var vornameLbl: UILabel!
    @IBOutlet weak var nachnameLbl: UILabel!
    @IBOutlet weak var straßeLbl: UILabel!
    @IBOutlet weak var plzLbl: UILabel!
    @IBOutlet weak var ortLbl: UILabel!
    
    @IBOutlet weak var vornameField: UITextField!
    @IBOutlet weak var nachnameField: UITextField!
    @IBOutlet weak var straßeField: UITextField!
    @IBOutlet weak var plzField: UITextField!
    @IBOutlet weak var ortField: UITextField!
    
    
    //#selector(insertNewObject(_:)))
    
    
    override func viewDidLoad() {
        
        print(editItem.vorname)
        super.viewDidLoad()
        
        
        vornameField.text = editItem.vorname
        nachnameField.text = editItem.nachname
        straßeField.text = editItem.straße
        plzField.text = String(editItem.plz)
        ortField.text = editItem.ort
    }
    
    @IBAction func submit(_ sender: Any) {
        let card = AddressCard.init(vorname: vornameField.text ?? "", nachname: nachnameField.text ?? "", straße: straßeField.text ?? "", plz: Int(plzField.text ?? "") ?? 0, ort: ortField.text ?? "")
        
        if let del = UIApplication.shared.delegate as? AppDelegate{
            del.book.remove(_card: helper.card)
            del.book.add(card: card)
            del.book.sort()
        }
        
    }
}
