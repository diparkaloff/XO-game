//
//  Prototype.swift
//  XO-game
//
//  Created by Дмитрий Паркалов on 31.08.22.

import Foundation

protocol Copying {
    init(_ prototype: Self)
}

extension Copying {
    func copy() -> Self {
        return type(of: self).init(self)
    }
}
