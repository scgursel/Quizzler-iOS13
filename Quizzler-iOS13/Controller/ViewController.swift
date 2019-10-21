//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var questionProgress: UIProgressView!
   
    
    @IBOutlet weak var firstChoice: UIButton!
    
    
    @IBOutlet weak var secondChoice: UIButton!
    
    
    @IBOutlet weak var thirdChoice: UIButton!
    
    var quizBrain = QuizBrain()

 
    var timer: Timer? = nil;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

        
    }
    
    
    
    @IBAction func answerButtonTapped(_ sender: UIButton) {
        
        
        
        let userAnswer = sender.currentTitle!
        if quizBrain.checkAnswer(userAnswer) {
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        if(quizBrain.checkQuestionNumber()){
            let alertController = UIAlertController(title: "Well Done", message: "You have \(quizBrain.currentScore) true answers in \(quizBrain.quiz.count)", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Ok", style: .default) { (action) in
               
            }
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)

        }
        timer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
        quizBrain.nextQuestion()
        
        
  
    }
    
    
    @objc func updateUI(){
        let choices = quizBrain.getChoices()
        firstChoice.setTitle(choices[0], for: .normal)
        secondChoice.setTitle(choices[1], for: .normal)
        thirdChoice.setTitle(choices[2], for: .normal)

        firstChoice.backgroundColor = UIColor.clear
        secondChoice.backgroundColor = UIColor.clear
        thirdChoice.backgroundColor = UIColor.clear

        
        questionLabel.text = quizBrain.getQuestion()
        questionProgress.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
    }
    
    
    
}

