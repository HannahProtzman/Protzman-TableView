//
//  CodeWord.swift
//  Protzman-TableView
//
//  Created by Protzman,Hannah R on 3/1/18.
//  Copyright © 2018 Protzman,Hannah R. All rights reserved.
//

import Foundation


class CodeWord {
    var symbols:[String] = []   //choices for the TableView
    var count:Int = 0                     //number of symbols in the code and guess
    var code:[String] = []         //the secret code
    var guess:[String] = []         //the current guess
    var onSymbol:Int = 0            //gives the index of the next place to add a symbol in the guess
    var attempts:Int = 0            //number of times that a guess has been made
    var status:String = "Guess the code"        //status message for the game
    var numCorrectGuess:Int = 0
    
    init() {
        self.symbols = ["A", "B", "C", "D", "E"]
//        self.code = ["A", "B", "D", "C", "A"]
        self.count = symbols.count
        
        var randomIndex:Int = Int(arc4random_uniform(5))
        for i in 0..<5 {
            code += [symbols[randomIndex]]
            randomIndex = Int(arc4random_uniform(5))
        }
        
    }
    
    func initAgain() {
        var randomIndex:Int = Int(arc4random_uniform(5))
        for i in 0..<5 {
            code += [symbols[randomIndex]]
            randomIndex = Int(arc4random_uniform(5))
        }
    }
    
    func addAttempt() -> Int {
        attempts += 1
        return attempts
    }
    
    func addSymbol(_ newSymbol:String) {
        onSymbol += 1
        guess += [newSymbol]
        statusMethod()
    }
    
    func numCorrect() -> Int {
        if guess.count == code.count {
        for i in 0..<guess.count {
            if guess[i] == code[i] {
                numCorrectGuess += 1
            }
        }
        }
        else {
            
        }
        return numCorrectGuess
    }
    
    func statusMethod() -> String {
        status = "Attempt \(attempts): \(attempts) symbols guessed"
        return status
    }
    
    func returnGuess() -> [String] {
        return guess
    }
    
    func reset() {
        guess = []
        numCorrectGuess = 0
        code = []
    }
    
    func getCode() -> String {
        var codeString:String = ""
        for i in 0..<code.count {
            codeString += code[i]
        }
        return codeString
        
    }
    
    
    
}
