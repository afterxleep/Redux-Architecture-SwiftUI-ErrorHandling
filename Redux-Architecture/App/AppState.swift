//
//  AppState.swift
//  Redux-Architecture
//
//  Created by Daniel Bernal on 7/30/20.
//

import Foundation

struct AppState {
    var animal: AnimalState
}

struct AnimalState {
    var current: String = ""
    var fetchError: String?
    var fetchInProgress: Bool = false
}
