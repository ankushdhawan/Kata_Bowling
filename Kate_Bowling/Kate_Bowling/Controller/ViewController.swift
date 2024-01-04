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
    var roundCount = 1
    var user1: User!
    override func viewDidLoad() {
        super.viewDidLoad()
        thirdRoll.isHidden = true
        user1 = User(bowlingFrame: [], name: "User1")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        user1.bowlingFrame.removeAll()
        firstRoll.text = ""
        secondRoll.text = ""
        thirdRoll.text = ""
        score.text = "0"
        roundCount = 1
        thirdRoll.isHidden = true
        titleScreen.text = "Round " + String(roundCount)
    }
    
    @IBAction func addFrameButtonTapped(_ sender: UIButton) {
        thirdRoll.isHidden = true
        if firstRoll.text!.isEmpty || secondRoll.text!.isEmpty {
            showAlert(title: "Error", message: "Please enter all the fields.")
        }else {
            let roll1Int: Int? = Int(firstRoll.text!)
            let roll2Int: Int? = Int(secondRoll.text!)
            let frame1 = BowlingFrame(bowlingRoll: BowlingRoll(firstTry: BowlingTry(knockedPins: roll1Int ?? 0), secondTry: BowlingTry(knockedPins: roll2Int ?? 0)))
            if user1.bowlingFrame.count == 9 {
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
            firstRoll.text = ""
            secondRoll.text = ""
            thirdRoll.text = ""
            do {
                score.text = String(try user1.getTotalScore())
                game = BowlingGame(users: [user1])
                roundCount = roundCount + 1
                if roundCount <= 10 {
                    titleScreen.text = "Round " + String(roundCount)
                }
            }catch GameError.wrongInput(let val){
                showAlert(title: "Error", message: val)
                user1.bowlingFrame.removeLast()
            }catch GameError.wrongFrameCount{
                showAlert(title: "Error", message: "Frame cannot be more than 10")
                user1.bowlingFrame.removeLast()
            }catch {
                
            }
        }
    }
    
    func showAlert(title:String, message:String) {
        var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}

