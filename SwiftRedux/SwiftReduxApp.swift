//
//  SwiftReduxApp.swift
//  SwiftRedux
//
//  Created by Dipak on 02/10/23.
//

import SwiftUI

@main
struct SwiftReduxApp: App {
    
    let store = Store(reducer: appReducer, state:AppState())
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(store)
        }
    }
}
