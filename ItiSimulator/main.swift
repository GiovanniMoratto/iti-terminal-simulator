//
//  main.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 29/09/21.
//

import Foundation

// MARK: - Attributes

/* Singleton */

var db = Database.shared
var session = Access.shared

/* Configs */

let system = SystemViewController()
let routeTo = system.routeTo()

// MARK: - Application

system.start()
