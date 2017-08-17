//
//  ViewController.swift
//  Quiz2
//
//  Created by Luke on 01/08/2017.
//  Copyright © 2017 LukeLukeLuke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var currentQuestionLabel: UILabel!
    @IBOutlet var currentQuestionLabelCenterXConstraint: NSLayoutConstraint!
    @IBOutlet var nextQuestionLabel: UILabel!
    @IBOutlet var nextQuestionLabelCenterXConstraint: NSLayoutConstraint!

    @IBOutlet var answerLabel: UILabel!
    
    @IBAction func showNextQuestion(sender:AnyObject){
        ++currentQuestionIndex
        if currentQuestionIndex == questions.count{
            currentQuestionIndex = 0
        }
    
    let question: String = questions[currentQuestionIndex]
    
        nextQuestionLabel.text = question
    answerLabel.text = "???"
        animateLabelTransitions()
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
        let question = questions[currentQuestionIndex]
        currentQuestionLabel.text = question
        
        updateOffScreenLabel()
    }
    
    func updateOffScreenLabel(){
        let screenWidth = view.frame.width
        nextQuestionLabelCenterXConstraint.constant = -screenWidth
    }
    
    func animateLabelTransitions(){
        
        view.layoutIfNeeded()
        
        let screenWidth = view.frame.width
        self.nextQuestionLabelCenterXConstraint.constant = 0
        self.currentQuestionLabelCenterXConstraint.constant += screenWidth

        UIView.animateWithDuration(0.5,
            delay: 0,
            options: [.CurveEaseIn],
            animations: {
                self.currentQuestionLabel.alpha = 0
                self.nextQuestionLabel.alpha = 1
                
                self.view.layoutIfNeeded()
        },
            completion: { _ in
                swap(&self.currentQuestionLabel,
                    &self.nextQuestionLabel)
                swap(&self.currentQuestionLabelCenterXConstraint,
                &self.nextQuestionLabelCenterXConstraint)
                
                self.updateOffScreenLabel()
        })
    }
    
    override func viewWillAppear(animated:Bool){
        super.viewWillAppear(animated)
        currentQuestionLabel.alpha = 0
    }
    
    

}

