//
//  ViewController.swift
//  RPS
//
//  Created by Wojuade Abdul Afeez on 08/08/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var appSign: UILabel!
    
    @IBOutlet weak var gameStatus: UILabel!
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    
    @IBOutlet weak var rockButton: UIButton!
    
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI(gameState: .start)
        
    }
    
    
    
    @IBAction func tappedPlayAgainButton(_ sender: UIButton) {
        updateUI(gameState: .start)
    }
    @IBAction func tappedRockButton(_ sender: UIButton) {
        play(sign: .rock)
    }
    
    
    @IBAction func tappedPaperButton(_ sender: UIButton) {
        play(sign: .paper)
    }
    
    @IBAction func tappedScissorButton(_ sender: UIButton) {
        play(sign: .scissors)
    }
    
    func updateUI(gameState: GameState){
        gameStatus.text = gameState.toString
        view.backgroundColor = gameState.backgroundColor
        if gameState == .start{
            appSign.text = "🤖"
            playAgainButton.isHidden = true
            enableAllPlayerSignButtons()
            showAllPlayerSignButtons()
        }
    }
    func play(sign: Sign){
        let opponentSign = randomSign()
        let gameState = sign.determineGameState(opponent: opponentSign)
        updateUI(gameState: gameState)
        appSign.text = opponentSign.emoji
        //disable Player buttons
        disableAllPlayerSignButtons()
        //hide all of the player sign buttons except the one the player tapped
        showSignUserSelected(sign: sign)
        //show play again button
        playAgainButton.isHidden = false
        
    }
    
    func showAllPlayerSignButtons(){
        rockButton.isHidden = false
        scissorsButton.isHidden = false
        paperButton.isHidden = false
    }
    
    func enableAllPlayerSignButtons()  {
        rockButton.isEnabled = true
        scissorsButton.isEnabled = true
        paperButton.isEnabled = true
    }
    func disableAllPlayerSignButtons(){
        rockButton.isEnabled = false
        scissorsButton.isEnabled = false
        paperButton.isEnabled = false
    }
    func showSignUserSelected(sign : Sign){
        switch sign{
        case .scissors:
            scissorsButton.isHidden = false
            rockButton.isHidden = true
            paperButton.isHidden = true
        case .paper:
            paperButton.isHidden = false
            rockButton.isHidden = true
            scissorsButton.isHidden = true
        case .rock:
            rockButton.isHidden = false
            paperButton.isHidden = true
            scissorsButton.isHidden = true
        }
        
    }
}

