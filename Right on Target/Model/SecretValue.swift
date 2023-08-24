//
//  GameRound.swift
//  Right on Target
//
//  Created by ramdau on 17.8.23..
//

import Foundation

protocol SecretValueProtocol {
    associatedtype ValueType
    var value: ValueType { get }
    
    mutating func setRandomValue()
}

struct SecretValue<T: Equatable> : SecretValueProtocol {
    typealias ValueType = T
    var value: T
    // closure for getting random value
    private let randomValueClosure: (T) -> T
    init(initialValue: T, randomValueClosure: @escaping (T) -> T) {
        self.value = initialValue
        self.randomValueClosure = randomValueClosure
    }
    mutating func setRandomValue() {
        self.value = randomValueClosure(self.value)
    }
}
