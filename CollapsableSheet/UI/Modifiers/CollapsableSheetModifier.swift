//
//  CollapsableSheetModifier.swift
//  CollapsableSheet
//

import SwiftUI

struct CollapsableSheetModifier<SheetContent: View, PreviewContent: View>: ViewModifier {
    @Binding var isPresented: Bool
    var config: Config
    @ViewBuilder var sheetContent: () -> SheetContent
    @ViewBuilder var previewContent: () -> PreviewContent
    
    private let animation = Animation.smooth(duration: 0.35)
    
    @State private var detent: PresentationDetent = .large
    
    private var previewDetent: PresentationDetent {
        switch config.previewHeight {
        case .fixed(let value): return .height(value)
        case .fraction(let value): return .fraction(value)
        }
    }
    
    func body(content: Content) -> some View {
        #if os(iOS)
        GeometryReader { proxy in
            content
                .padding(.bottom, contentBottomPadding(for: proxy))
                .mask(maskShape(for: proxy))
                .animation(animation, value: isPresented)
                .background(config.background, ignoresSafeAreaEdges: .all)
                .sheet(isPresented: $isPresented) {
                    sheetView
                }
                .onChange(of: isPresented) {
                    if isPresented { detent = .large }
                }
        }
        #else
        content
        #endif
    }
    
    @ViewBuilder
    private var sheetView: some View {
        ZStack {
            if detent == .large {
                sheetContent()
            } else {
                previewOverlay
            }
        }
        .presentationBackgroundInteraction(.enabled(upThrough: previewDetent))
        .presentationDetents([.large, previewDetent], selection: $detent)
        .presentationDragIndicator(detent == .large ? .visible : .hidden)
        .interactiveDismissDisabled()
        .animation(animation, value: detent)
    }
    
    @ViewBuilder
    private var previewOverlay: some View {
        ZStack {
            Color.primary.colorInvert()
                .contentShape(Rectangle())
                .onTapGesture { detent = .large }
                .gesture(DragGesture().onChanged { _ in })
                .allowsHitTesting(true)
                .ignoresSafeArea()
            previewContent()
        }
    }
    
    private func contentBottomPadding(for geometry: GeometryProxy) -> CGFloat {
        guard isPresented else { return 0 }
        
        switch config.previewHeight {
        case .fixed(let value): return value + config.spacing
        case .fraction(let value): return geometry.size.height * value + config.spacing
        }
    }
    
    private func maskShape(for geometry: GeometryProxy) -> some View {
        let insets = maskInsets(for: geometry)
        return UnevenRoundedRectangle(
            bottomLeadingRadius: config.cornerRadius,
            bottomTrailingRadius: config.cornerRadius
        )
        .padding(insets)
    }
    
    private func maskInsets(for geometry: GeometryProxy) -> EdgeInsets {
        var insets = geometry.safeAreaInsets
        insets.negate()
        
        if isPresented {
            insets.bottom = contentBottomPadding(for: geometry)
        }
        
        return insets
    }
}
