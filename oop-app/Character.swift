//
//  Character.swift
//  oop-app
//
//  Created by Raizlabs Corp on 11/19/15.
//  Copyright © 2015 Raizlabs Corp. All rights reserved.
//

import Foundation

class Character {
    private var _hp: Int = 100
    private var _attackPwr: Int = 25
//    some default values
    
    var hp: Int {
        get {
            return _hp
        }
    }
    
    var attackPwr: Int {
//        now become get only props. can't assign a value to attackPwr using this var.
        get {
            return _attackPwr
        }
    }
    
    var isAlive: Bool {
        get {
            if hp <= 0 {
                return false
            } else {
                return true
            }
        }
    }
    
    init(startingHp: Int, attackPwr: Int) {
        self._hp = startingHp
        self._attackPwr = attackPwr
    }
    
    func attempAttack(attackPwr: Int) {
        self._hp -= attackPwr
    }
}
