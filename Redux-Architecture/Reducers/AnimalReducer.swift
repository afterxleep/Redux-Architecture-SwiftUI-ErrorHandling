//
//  AnimalReducer.swift
//  Redux-Architecture
//
//  Created by Daniel Bernal on 8/2/20.
//

import Foundation

func animalReducer(state: inout AnimalState, action: AnimalAction) -> Void {
    
    switch(action) {
        case .fetch:
            state.fetchError = nil
            state.fetchInProgress = true
        
        case .fetchComplete(let animal):
            state.fetchInProgress = false
            state.current = animal
    
        case .fetchError(let error):
            state.fetchInProgress = false
            switch error {
                case AnimalMiddlewareError.networkError:
                    state.fetchError = "Oops!.  It seems someone made a mistake!"
            default:
                state.fetchError = "I'm sorry, but the server went away"
            }
    }
}
