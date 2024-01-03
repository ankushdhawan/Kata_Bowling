//
//  ViewController.swift
//  Kate_Bowling
//
//  Created by Ankush Dhawan on 03/01/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var titleScreen:UILabel!
    @IBOutlet weak var score:UILabel!
    @IBOutlet weak var firstRoll:UITextField!
    @IBOutlet weak var secondRoll:UITextField!
    @IBOutlet weak var thirdRoll:UITextField!
    var game: BowlingGame!
    var user1: User!
    override func viewDidLoad() {
        super.viewDidLoad()
        thirdRoll.isHidden = true
        user1 = User(bowlingFrame: [], name: "User1")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addFrameButtonTapped(_ sender: UIButton) {
        thirdRoll.isHidden = true
        let roll1Int: Int? = Int(firstRoll.text!)
        let roll2Int: Int? = Int(secondRoll.text!)
        let frame1 = BowlingFrame(bowlingRoll: BowlingRoll(firstTry: BowlingTry(knockedPins: roll1Int ?? 0), secondTry: BowlingTry(knockedPins: roll2Int ?? 0)))
        if user1.bowlingFrame.count == 10 {
            frame1.bowlingRoll.isLastFrame = true
            if roll1Int ?? 0  == 10 || (roll2Int ?? 0) + (roll1Int ?? 0) == 10 {
             thirdRoll.isHidden = false
                if thirdRoll.text!.isEmpty {
                    showAlert(title: "Error", message: "enter third roll")
                    return
                }
                let roll3Int: Int? = Int(thirdRoll.text!)
                frame1.bowlingRoll.thirdTry?.knockedPins = roll3Int ?? 0
            }
        }
        user1.bowlingFrame.append(frame1)
        titleScreen.text = "Frame " + String(user1.bowlingFrame.count)
        firstRoll.text = ""
        secondRoll.text = ""
        thirdRoll.text = ""
        do {
            score.text = String(try user1.getTotalScore())
            game = BowlingGame(users: [user1])
        }catch GameError.wrongInput(let val){
            showAlert(title: "Error", message: val)
            user1.bowlingFrame.removeLast()
            titleScreen.text = "Frame " + String(user1.bowlingFrame.count)
        }catch GameError.wrongFrameCount{
            showAlert(title: "Error", message: "Frame cannot be more than 10")
            user1.bowlingFrame.removeLast()
            titleScreen.text = "Frame " + String(user1.bowlingFrame.count)
        }catch {
            
        }
    }
    
    func showAlert(title:String, message:String) {
        var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}

