//
//  AnimalAction.swift
//  Redux-Architecture
//
//  Created by Daniel Bernal on 8/2/20.
//

import Foundation

enum AnimalAction {
    case fetch
    case fetchComplete(animal: String)
    case fetchError(error: Error?)
}
