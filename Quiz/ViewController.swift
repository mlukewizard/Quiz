//
//  ViewController.swift
//  Quiz
//
//  Created by Luke Markham on 17/07/2017.
//  Copyright © 2017 Luke Markham. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var questionlabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    let questions: [String] = ["From what is cognac made?",
                               "What is 7+7?",
                                "What is the captial of Vermont?"]
    
    let answers: [String] = ["Grapes",
                             "14",
                             "Montpelier"]
    
    var currentQuestionIndex: Int = 0

    @IBAction func showNextQuestion(sender:AnyObject){
        currentQuestionIndex += 1
        if currentQuestionIndex == questions.count{
            currentQuestionIndex = 0
        }
        
        let question: String = questions[currentQuestionIndex]
        questionlabel.text = question
        answerLabel.text = "???"
    }
    
    @IBAction func showAnswer(sender:AnyObject){
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        questionlabel.text = questions[currentQuestionIndex]
    }
    
}

