//
//  ChatErrors.swift
//  WBChat
//
//  Created by Vladimir on 05.08.2024.
//

import Foundation

enum ChatError: Error {
    case unknown(source: Error?)
}
