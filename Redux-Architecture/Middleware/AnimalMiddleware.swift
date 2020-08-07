//
//  AnimalMiddleware.swift
//  Redux-Architecture
//
//  Created by Daniel Bernal on 8/2/20.
//

import Foundation
import Combine

enum AnimalMiddlewareError: Error {
    case unknown
    case networkError
}

func animalMiddleware(service: AnimalService) -> Middleware<AppState, AppAction> {
    
    return { state, action in
        switch action {
            
        case .animal(.fetch):
                return service.generateAnimalInTheFuture()
                    .subscribe(on: DispatchQueue.main)
                    .map { AppAction.animal(action: .fetchComplete(animal: $0 )) }
                    .catch { (error: AnimalServiceError) -> Just<AppAction> in
                        switch(error) {
                        case .unknown:
                            return Just(AppAction.animal(action: .fetchError(error: AnimalMiddlewareError.unknown)))
                        case .networkError:
                            return Just(AppAction.animal(action: .fetchError(error: AnimalMiddlewareError.networkError)))
                        }
                    }
                    .eraseToAnyPublisher()
                    
            default:
                break
            }
        
        return Empty().eraseToAnyPublisher()
    }
}
