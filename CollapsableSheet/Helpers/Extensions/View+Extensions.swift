//
//  View+Extensions.swift
//  CollapsableSheet
//

import SwiftUI

extension View {

    func collapsableSheet<SheetContent: View, PreviewContent: View>(
        isPresented: Binding<Bool>,
        config: Config = .init(),
        @ViewBuilder content: @escaping () -> SheetContent,
        @ViewBuilder preview: @escaping () -> PreviewContent
    ) -> some View {
        self
            .modifier(
                CollapsableSheetModifier(
                    isPresented: isPresented,
                    config: config,
                    sheetContent: content,
                    previewContent: preview
                )
            )
    }
}
