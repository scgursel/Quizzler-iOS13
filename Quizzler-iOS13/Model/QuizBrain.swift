//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Servet Can Gürsel on 19.08.2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation
import UIKit

struct QuizBrain {
    var questionNumber = 0
    var currentScore = 0
   
    let quiz = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
        
    ]
    
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool{
        
        if userAnswer == quiz[questionNumber].correctAnswer{
            currentScore += 1
            return true
            
        }else{
            return false
        }
        
    }
    
    func getQuestion() -> String {
        return quiz[questionNumber].text
    }
    func getProgress() -> Float {
        return Float(questionNumber) / Float(quiz.count)
    }
    
    mutating func nextQuestion(){
        if(questionNumber + 1 < quiz.count){
            questionNumber+=1
        }else{
            questionNumber = 0
            currentScore = 0
        }
    }
    func getScore() -> Int {
        return currentScore
    }
    func getChoices() -> [String] {
        return quiz[questionNumber].answers
    }
    mutating func checkQuestionNumber() -> Bool {
        if questionNumber + 1 == quiz.count{
            
            return true
        }else{
            return false
        }
    }
    
}
