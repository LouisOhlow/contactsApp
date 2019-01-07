//
//  AddressBook.swift
//  iOS3-Ohlow-Driescher
//
//  Created by Jan Driescher on 12.11.18.
//  Copyright © 2018 Jan Driescher. All rights reserved.
//

import Foundation

class AddressBook:Codable{
    
    var addressCards = [AddressCard]()
    
    func add(card: AddressCard){
        addressCards.append(_:card)
    }
    
    func remove(_card: AddressCard){
        if let index = addressCards.index(of: _card){
            addressCards.remove(at: index)
            
            for card in addressCards{
                card.remove(friend: _card)
                card.updateFriendStr()
            }
        }
        
    }
    
    func sort(){
        addressCards.sort(by: { (s1: AddressCard, s2: AddressCard) -> Bool in
            return s1.nachname < s2.nachname
        })
    }
    
    func lookUp(nachname:String)->AddressCard?{
        for card in addressCards{
            if card.nachname == nachname{
                return card
            }
        }
        return nil
    }
    
    func save(toFile path: String){
        let path = path
        let url = URL(fileURLWithPath: path)
        print(url)
        let encoder = PropertyListEncoder()
        
        if let data = try? encoder.encode(self) {
            try? data.write(to: url)
        }
    }
    
    class func addressBook(fromFile path: String) -> AddressBook?{
        let path = path
        let url = URL(fileURLWithPath: path)
        
        if let data = try? Data(contentsOf: url) {
            let decoder = PropertyListDecoder()
            
            if let adressBook = try? decoder.decode(AddressBook.self, from: data){
                return adressBook
                
            }
            
        }
        print("No adress book was created.")
        return nil
    }
}
