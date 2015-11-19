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
    @IBOutlet weak var playAgainBtn: UIButton!
    
    var player1: Character!
    var player2: Character!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPlayers()
    }
    
    @IBAction func onPlayer1AttackPressed(sender: AnyObject) {
        attack(player1, attacked: player2)
    }
    
    
    @IBAction func onPlayer2AttackPressed(sender: AnyObject) {
        attack(player2, attacked: player1)
    }
    
    func attack(attacker: Character, attacked: Character) {
        attacked.takeAttack(attacker.attackPwr)
        if attacked.isAlive {
            actionLbl.text = "\(attacked.name) took \(attacker.attackPwr) damage"
        } else {
            actionLbl.text = "\(attacked.name) has been slain! \(attacker.name) wins!"
            gameOver()
        }
    }
    
    
    @IBAction func onPlayAgainPressed(sender: AnyObject) {
        resetGame()
    }
    
    func gameOver() {
        player1AttackBtn.enabled = false
        player2AttackBtn.enabled = false
        playAgainBtn.hidden = false
    }
    
    func resetGame() {
        setupPlayers()
        playAgainBtn.hidden = true
        player1AttackBtn.enabled = true
        player2AttackBtn.enabled = true
    }
    
    func setupPlayers() {
        player1 = Character(startingHp: 120, attackPwr: 20, name: "Orc")
        player2 = Character(startingHp: 100, attackPwr: 30, name: "Legionnaire")
    }

}

