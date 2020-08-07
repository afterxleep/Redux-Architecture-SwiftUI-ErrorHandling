//
//  AnimalView.swift
//  Redux-Architecture
//
//  Created by Daniel Bernal on 7/30/20.
//

import SwiftUI

struct AnimalView: View {
    @EnvironmentObject var store: AppStore
    
    func loadAnimal() {
        store.dispatch(.animal(action: .fetch))
    }
        
    var body: some View {
        
        let shouldDisplayError =  Binding<Bool>(
            get: { store.state.animal.fetchError != nil },
            set: { _ in store.dispatch(.animal(action: .fetchError(error: nil))) }
        )
        
        VStack {
            if(store.state.animal.fetchInProgress) {
                ProgressView("Fetching Animal...")
            }
            else {
                Text(store.state.animal.current).font(.system(.largeTitle)).padding()
                Button("Tap me", action: { self.loadAnimal() })
            }            
        }
        .alert(isPresented: shouldDisplayError) {
            Alert(title: Text("An error has Ocurred"),
                  message: Text(store.state.animal.fetchError ?? ""),
                  dismissButton: .default(Text("Got it!")))
        }
    }
}
