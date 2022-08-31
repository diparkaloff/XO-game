//
//  LogInvoker.swift
//  XO-game
//
//  Created by Дмитрий Паркалов on 31.08.22.

import Foundation

class LogInvoker {
    public static let shared = LogInvoker()
    
    private let receiver = LogReceiver()
    private let bufferSize = 6
    private var commands: [LogCommand] = []
    
    
    private init() {
        
    }
    
    func addLogCommand(command: LogCommand) {
        commands.append(command)
        execute()
    }
    
    private func execute() {
        guard !commands.isEmpty, commands.count >= bufferSize else {
            return
        }
        
        commands.forEach { receiver.sendMessage(message: $0.logMessage) }
        commands = []
    }
}
