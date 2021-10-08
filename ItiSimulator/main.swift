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

func routeTo() -> (controller: ControllerRoutes, view: ViewsRoutes)  {
    return (ControllerRoutes(), ViewsRoutes())
}

func initialData() {
    DataTest().initialData()
}

func start() {
    routeTo().controller.welcome()
}

initialData()
start()
