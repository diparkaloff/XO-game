//
//  MainViewController.swift
//  XO-game
//
//  Created by Дмитрий Паркалов on 31.08.22.

import UIKit

class MainViewController: UIViewController {

    var id = "ToGameVC"
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == id {
            let vc = segue.destination as! GameViewController
            vc.gameType = sender as? GameType
        }
    }
    
    @IBAction func twoPlayersButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: id, sender: GameType.twoPlayers)
    }
    
    @IBAction func blindfoldTwoPlayersButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: id, sender: GameType.blindfoldTwoPlayers)
    }
    
    @IBAction func playWithComputerButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: id, sender: GameType.withComputerGame)
    }
    
    @IBAction func unwindFromGameVCSegue(segue: UIStoryboardSegue) { }
}
