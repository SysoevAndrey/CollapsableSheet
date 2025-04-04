//
//  TaskFormView.swift
//  CollapsableSheet
//

import SwiftUI

struct TaskFormView: View {
    @Binding var isSheetPresented: Bool

    @State private var taskTitle: String = ""
    @State private var taskDescription: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Task Details")) {
                    TextField("Title", text: $taskTitle)
                    TextField("Description", text: $taskDescription)
                }
            }
            .navigationTitle("New Task")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        isSheetPresented = false
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        isSheetPresented = false
                    }
                }
            }
        }
    }
}

#Preview {
    TaskFormView(isSheetPresented: .constant(true))
}
