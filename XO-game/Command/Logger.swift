//
//  Logger.swift
//  XO-game
//
//  Created by Дмитрий Паркалов on 31.08.22.

import Foundation

class Logger {
    public static var shared = Logger()
    
    private init() {}
    
    public func log(action: LogAction) {
        let command = LogCommand(action: action)
        LogInvoker.shared.addLogCommand(command: command)
    }
}
