//
//  ViewController.swift
//  Protzman-TableView
//
//  Created by Protzman,Hannah R on 2/27/18.
//  Copyright © 2018 Protzman,Hannah R. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

//    override func viewDidAppear(_ animated: Bool) {
//        let myModel = AppDelegate.myModel.initializer()
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myModel = AppDelegate.myModel
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = myModel!.symbols[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let myModel = AppDelegate.myModel
        if indexPath.row == 0 {
            guessLBL.text? += "A"
            myModel!.addSymbol("A")
            
        }
        else if indexPath.row == 1 {
            guessLBL.text? += "B"
            myModel!.addSymbol("B")
        }
        else if indexPath.row == 2 {
            guessLBL.text? += "C"
            myModel!.addSymbol("C")
        }
        else if indexPath.row == 3 {
            guessLBL.text? += "D"
            myModel!.addSymbol("D")
        }
        else if indexPath.row == 4 {
            guessLBL.text? += "E"
            myModel!.addSymbol("E")
        }
        
    }
    
    @IBAction func submitGuess(_ sender: Any) {
        let myModel = AppDelegate.myModel
        var correct = myModel!.numCorrect()
        var attemptN = myModel!.addAttempt()
        attemptLBL.text? = "Attempt #: \(attemptN)"
        if correct == myModel!.count {
            correctNumLBL.text? = "You got \(correct) correct!"
            congratsLBL.text? = "Congrats you got them all right!"
        }
        else {
            correctNumLBL.text? = "You only got \(correct) correct"
        }
        
    }
    
    @IBAction func reset(_ sender: Any) {
        let myModel = AppDelegate.myModel.reset()
        guessLBL.text? = "Guess: "
//        let myModel2 = AppDelegate.myModel
//        var attemptN = myModel2!.addAttempt()
//        attemptLBL.text? = "Attempt #: \(attemptN)"
        correctNumLBL.text? = "Num Correct: "
        congratsLBL.text? = ""
        correctCodeLBL.text? = ""
        let myModel2 = AppDelegate.myModel
        myModel2!.initAgain()
    }
    
    @IBAction func giveUp(_ sender: Any) {
        let myModel = AppDelegate.myModel
        var corCode:String = ""
        corCode = myModel!.getCode()
        correctCodeLBL.text? = "The correct code was: \(corCode)"
    }
    
    @IBOutlet weak var correctCodeLBL: UILabel!
    
    @IBOutlet weak var guessLBL: UILabel!
    
    @IBOutlet weak var attemptLBL: UILabel!
    
    @IBOutlet weak var correctNumLBL: UILabel!
    
    @IBOutlet weak var congratsLBL: UILabel!
}

