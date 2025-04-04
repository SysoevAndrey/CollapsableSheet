//
//  ContentView.swift
//  CollapsableSheet
//

import SwiftUI

struct ContentView: View {
    @State private var isSheetPresented = false
    
    var body: some View {
        RootContentView(isSheetPresented: $isSheetPresented)
            .collapsableSheet(isPresented: $isSheetPresented) {
                TaskFormView(isSheetPresented: $isSheetPresented)
            } preview: {
                PreviewView()
            }
    }
}

#Preview {
    ContentView()
}
