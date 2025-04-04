//
//  RootContentView.swift
//  CollapsableSheet
//

import SwiftUI

struct RootContentView: View {
    @Binding var isSheetPresented: Bool
    
    var body: some View {
        NavigationStack {
            List(0..<20, id: \.self) { index in
                GroupBox {
                    HStack {
                        Image(systemName: "circle.fill")
                            .foregroundColor(Color(
                                red: .random(in: 0...1),
                                green: .random(in: 0...1),
                                blue: .random(in: 0...1)
                            ))
                        Text("Task #\(index + 1)")
                            .font(.headline)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }
                }
                .listRowSeparator(.hidden)
                .listRowInsets(
                    .init(
                        top: 4,
                        leading: 16,
                        bottom: 4,
                        trailing: 16
                    )
                )
            }
            .listStyle(.plain)
            .navigationTitle("Dashboard")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button("New Task") {
                        isSheetPresented = true
                    }
                    .disabled(isSheetPresented)
                }
            }
        }
    }
}

#Preview {
    RootContentView(isSheetPresented: .constant(false))
}
