//
//  ObservableObject.swift
//  MVVM_Architecture
//
//  Created by Wojciech Spaleniak on 05/10/2022.
//

// WE CAN USE ALSO RXSWIFT OR COMBINE

import Foundation

final class ObservableObject<T> {
    
    var value: T {
        didSet {
            listener?(value)
            print("ObservableObject -> ustawiono value = \(value)")
        }
    }
    
    private var listener: ((T) -> Void)?
    
    init(_ value: T) {
        self.value = value
        print("ObservableObject -> zainicjalizowano obiekt, value = \(value)")
    }
    
    func bind(_ listener: @escaping(T) -> Void) {
        print("ObservableObject -> rozpoczynam bind(), value = \(value)")
        listener(value)
        self.listener = listener
        print("ObservableObject -> wykonano bind(), value = \(value)")
    }
}
