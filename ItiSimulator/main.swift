//
//  main.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 29/09/21.
//

import Foundation

// MARK: - Database

var db = Database()
db.initialData()

// MARK: - Execution

WelcomeView().start()
