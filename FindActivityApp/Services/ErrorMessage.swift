//
//  ErrorMessage.swift
//  FindActivityApp
//
//  Created by Илья Нечаев on 26.09.2021.
//

import Foundation

enum ErrorMessage: String, Error {
    case invalidData = "Sorry. Something went wrong, try again"
    case invalidResponse = "Server error. Pleas modify your search and try again"
}
