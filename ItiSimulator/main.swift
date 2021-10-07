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

func router() -> (controller: ControllerRoutes, view: ViewsRoutes)  {
    return (ControllerRoutes(), ViewsRoutes())
}

func initialData() {
    Data().initialData()
}

func start() {
    router().controller.welcome()
}

initialData()
start()
