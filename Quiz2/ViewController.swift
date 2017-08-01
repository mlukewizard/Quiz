//
//  ViewController.swift
//  Quiz2
//
//  Created by Luke on 01/08/2017.
//  Copyright © 2017 LukeLukeLuke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    @IBAction func showNextQuestion(sender:AnyObject){
        ++currentQuestionIndex
        if currentQuestionIndex == questions.count{
            currentQuestionIndex = 0
        }
    
    
    let question: String = questions[currentQuestionIndex]
    questionLabel.text = question
    answerLabel.text = "???"
        }
    
    @IBAction func showAnswer(sender:AnyObject){
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
    }
    
    let questions: [String] = ["From what is cognac made?",
                                "What is 7+7",
                                "What is the capital of Vermont?"]
    let answers: [String] = ["Grapes",
                                "14",
                                "Montpelier"]
    var currentQuestionIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questions[currentQuestionIndex]
    }
    

}

