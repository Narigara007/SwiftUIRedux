//
//  AddTaskView.swift
//  SwiftRedux
//
//  Created by Dipak on 02/10/23.
//

import SwiftUI

struct AddTaskView: View {
    @State private var name: String = ""
    @EnvironmentObject var store: Store<AppState>
    
    struct Props {
        
        //props
        let tasks : [Task]
        
        //dispatch
        var onAddTask : (Task) -> ()
    }
    
    private func map(state: TaskState) -> Props {
        return  Props(tasks: state.tasks,onAddTask:{ task in
            store.dispatch(action: AddTaskAction(task: task))
        })
    }
    
    var body: some View {
        
        let props = map(state: store.state.taskState)
        return VStack {
            TextField("Enter Task", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(10)
            Button("Add"){
                let task = Task(title: self.name)
                props.onAddTask(task)
            }
            List(props.tasks, id: \.id ) { task in
                Text(task.title)
            }
            Spacer()
        }.padding(10)
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        let store = Store(reducer: appReducer,state: AppState())
        return AddTaskView().environmentObject(store)
    }
}
