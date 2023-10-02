//
//  CounterReducer.swift
//  SwiftRedux
//
//  Created by Dipak on 02/10/23.
//

import Foundation

func counterReducer(_ state: CounterState, _ action:Action) -> CounterState {
    var state = state
    switch action {
    case _ as IncrementAction:
        state.counter += 1
    case _ as DecrementAction:
        state.counter -= 1
    default:
        break
    }
    
    return state
}
