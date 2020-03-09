//
//  Observable.swift
//  MVVMObserverPattern
//
//  Created by wfh on 09/03/20.
//  Copyright © 2020 Harsha. All rights reserved.
//

import Foundation

class Observable<T> {
    private var observer: ((T) -> Void)?
    
    var value: T {
        didSet {
            notify()
        }
    }
    
    private func notify() {
        observer?(value)
    }
    
//    init observer with a default value and an optional observer
    required init(element: T, observer: ((T) -> Void)? = nil) {
        self.observer = observer
        value = element
    }
    
    func observe(observer: @escaping (T) -> Void) {
        self.observer = observer
        notify()
    }
    
    func bind<T, U>(keyPath: ReferenceWritableKeyPath<T, U>, of object: T, to observable: Observable<U>) where T: AnyObject {
        observable.observe { [weak object] value in
            object?[keyPath: keyPath] = value
        }
    }
}
