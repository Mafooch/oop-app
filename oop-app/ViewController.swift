//
//  ViewController.swift
//  oop-app
//
//  Created by Raizlabs Corp on 11/19/15.
//  Copyright © 2015 Raizlabs Corp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var actionLbl: UILabel!
    @IBOutlet weak var player1AttackBtn: UIButton!
    @IBOutlet weak var player2AttackBtn: UIButton!
    
    var player1: Character!
    var player2: Character!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPlayers()
    }
    
    @IBAction func onPlayer1AttackPressed(sender: AnyObject) {
        player2.takeAttack(player1.attackPwr)
        if player2.isAlive {
            actionLbl.text = "\(player2.name) took \(player1.attackPwr) damage"
        } else {
            actionLbl.text = "\(player2.name) has been slain! \(player1.name) wins!"
            gameOver()
        }
    }
    
    
    @IBAction func onPlayer2AttackPressed(sender: AnyObject) {
        player1.takeAttack(player2.attackPwr)
        if player1.isAlive {
            actionLbl.text = "\(player1.name) took \(player2.attackPwr) damage"
        } else {
            actionLbl.text = "\(player1.name) has been slain! \(player2.name) wins!"
            gameOver()
        }
        
    }
    
    func gameOver() {
        player1AttackBtn.enabled = false
        player2AttackBtn.enabled = false
    }
    
    func resetGame() {
        setupPlayers()
        player1AttackBtn.enabled = true
        player2AttackBtn.enabled = true
    }
    
    func setupPlayers() {
        player1 = Character(startingHp: 120, attackPwr: 20, name: "Orc")
        player2 = Character(startingHp: 100, attackPwr: 30, name: "Legionnaire")
    }

}

