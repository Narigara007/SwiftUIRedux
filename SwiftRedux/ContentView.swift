//
//  ContentView.swift
//  SwiftRedux
//
//  Created by Dipak on 02/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var store: Store<AppState>
    
    struct Props {
        let counter: Int
        let onIncrement:() -> Void
        let onDecrement:() -> Void
    }
    
    private func map(state: CounterState) -> Props {
        Props(counter: state.counter, onIncrement: {
            store.dispatch(action: IncrementAction())
        }, onDecrement: {
            store.dispatch(action: DecrementAction())
        })
    }
    var body: some View {
        
        let props = map(state: store.state.counterState)
        VStack {
            Text("\(props.counter)")
                .padding(10)
            Button("Increment"){
                props.onIncrement()
            }
            .padding(10)
            Button("Decrement"){
                props.onDecrement()
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let store = Store(reducer: counterReducer,state: CounterState())
        return ContentView().environmentObject(store)
    }
}
