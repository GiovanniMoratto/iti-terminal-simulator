//
//  main.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 29/09/21.
//

import Foundation

// MARK: - Attributes

var db = Database.shared
let controller = routes().controller
let view = routes().view

// MARK: - Methods

func routes() -> (controller: ControllerRoutes, view: ViewsRoutes)  {
    return (ControllerRoutes(), ViewsRoutes())
}

func initialData() {
    Data().initialData()
}

func start() {
    controller.welcome()
}

initialData()
start()
