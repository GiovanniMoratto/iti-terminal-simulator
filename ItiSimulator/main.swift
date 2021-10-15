//
//  main.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 29/09/21.
//

import Foundation

// MARK: - Attributes

var db = Database.shared

// MARK: - Methods

func routeTo() -> ControllerRoutes {
    return ControllerRoutes()
}

func initialData() {
    DataTest().initialData()
}

func start() {
    routeTo().system()
}

initialData()
start()
