//
//  ContentView.swift
//  SwiftRedux
//
//  Created by Dipak on 02/10/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isPresented: Bool = false
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
            Spacer()
            Button("Add Task") {
                isPresented = true
            }
        }
        .sheet(isPresented: $isPresented) {
            Text("Add Task View")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let store = Store(reducer: appReducer,state: AppState())
        return ContentView().environmentObject(store)
    }
}
