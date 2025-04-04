//
//  Config.swift
//  CollapsableSheet
//

import SwiftUI

struct Config {
    let spacing: CGFloat
    let cornerRadius: CGFloat
    let background: Color
    let previewHeight: PreviewHeight
    
    init(
        spacing: CGFloat = 2.0,
        cornerRadius: CGFloat = 10.0,
        background: Color = .black,
        previewHeight: PreviewHeight = .fraction(0.1)
    ) {
        self.spacing = spacing
        self.cornerRadius = cornerRadius
        self.background = background
        self.previewHeight = previewHeight
    }
    
    enum PreviewHeight {
        case fixed(CGFloat)
        case fraction(CGFloat)
    }
}
