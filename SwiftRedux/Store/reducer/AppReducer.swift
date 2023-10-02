//
//  AppReducer.swift
//  SwiftRedux
//
//  Created by Dipak on 02/10/23.
//

import Foundation

func appReducer(_ state: AppState, _ action:Action) -> AppState {
    var state = state
    state.counterState = counterReducer(state.counterState, action)
    return state
}
