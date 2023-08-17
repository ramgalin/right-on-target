//
//  Game.swift
//  Right on Target
//
//  Created by ramdau on 17.8.23..
//

import Foundation

protocol GameProtocol {
    var score: Int { get }
    var currentSecretValue: Int { get }
    var isGameEnded: Bool { get }
    
    func restartGame()
    func startNewRound()
    func calculateScore(with value: Int)
}

class Game : GameProtocol {
    var score: Int = 0
    
    private var minSecretValue: Int
    private var maxSecretValue: Int
    
    var currentSecretValue: Int = 0
    
    private var numOfRounds: Int
    private var currentRound: Int = 1
    
    var isGameEnded: Bool {
        if currentRound >= numOfRounds {
            return true
        } else {
            return false
        }
    }
    
    init?(startValue: Int, endValue: Int, rounds: Int) {
        guard startValue <= endValue else {
            return nil
        }
        
        minSecretValue = startValue
        maxSecretValue = endValue
        
        numOfRounds = rounds
        currentSecretValue = self.getNewSecretValue()
    }
    
    func restartGame() {
        currentRound = 0
        score = 0
        startNewRound()
    }
    
    func startNewRound() {
        currentSecretValue = self.getNewSecretValue()
        currentRound += 1
    }
    
    private func getNewSecretValue() -> Int {
        (minSecretValue...maxSecretValue).randomElement()!
    }
    
    func calculateScore(with value: Int) {
        if value > currentSecretValue {
            score += 50 - value + currentSecretValue
        } else {
            score += 50 - currentSecretValue + value
        }
    }
}
