//
//  Game.swift
//  Right on Target
//
//  Created by ramdau on 17.8.23..
//

import Foundation

protocol GameProtocol {
    associatedtype SecretValueType
    
    var score: Int { get }
    var secretValue: SecretValueType { get }
    var isGameEnded: Bool { get }
    
    func restartGame()
    func startNewRound()
    func calculateScore(secretValue: SecretValueType, userValue: SecretValueType)
}

class Game<T: SecretValueProtocol> : GameProtocol {
    typealias SecretValueType = T
    
    var score: Int = 0
    var secretValue: T
    
    private var compareClosure: (T, T) -> Int
    private var roundsCount: Int!
    private var currentRoundNumber: Int = 0
    
    var isGameEnded: Bool {
        if currentRoundNumber == roundsCount {
            return true
        } else {
            return false
        }
    }
    
    init(secretValue: T, rounds: Int, compareClosure: @escaping (T,T) -> Int) {
        self.secretValue = secretValue
        self.roundsCount = rounds
        self.compareClosure = compareClosure
        startNewRound()
    }
    
    func restartGame() {
        score = 0
        currentRoundNumber = 0
        startNewRound()
    }
    
    func startNewRound() {
        currentRoundNumber += 1
        self.secretValue.setRandomValue()
    }
    
    func calculateScore(secretValue: T, userValue: T) {
        score += compareClosure(secretValue, userValue)
    }
}
