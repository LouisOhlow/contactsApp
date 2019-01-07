//
//  AddressCard.swift
//  iOS3-Ohlow-Driescher
//
//  Created by Jan Driescher on 12.11.18.
//  Copyright © 2018 Jan Driescher. All rights reserved.
//

import Foundation

class AddressCard:Codable, Equatable{
    
    static func == (left: AddressCard, right: AddressCard) -> Bool {
        return right.vorname == left.vorname && right.nachname == left.nachname
    }
    init() {
    }
    
    init(vorname: String, nachname: String, straße: String, plz: Int, ort: String) {
        self.vorname = vorname
        self.nachname = nachname
        self.straße = straße
        self.plz = plz
        self.ort = ort
    }
    
    var vorname = ""
    var nachname = ""
    var straße = ""
    var plz = 0
    var ort = ""
    
    var hobbies = [String]()
    var friends = [AddressCard]()
    var friendsStr = [String]()
    
    enum CodingKeys: String, CodingKey {
        case vorname
        case nachname
        case straße
        case plz
        case ort
        case hobbies
        case friendsStr
    }
    
    func add(hobby:String){
        hobbies.append(_:hobby)
    }
    
    func remove(hobby: String){
        if let index = hobbies.index(of: hobby){
            hobbies.remove(at: index)
        }
    }
    
    func updateFriendStr(){
        friendsStr.removeAll()
        for friend in friends{
            friendsStr.append(friend.vorname + " " + friend.nachname)
        }
    }
    
    func add(friend: AddressCard){
        friends.append(_:friend)
        if !friend.friends.contains(self){
            friend.add(friend: self)
        }
        updateFriendStr()
    }
    
    func remove(friend: AddressCard){
        if let index = friends.index(of: friend){
            friends.remove(at: index)
        }
    }
    
    
    
    
}
