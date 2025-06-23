//
//  Glyph.swift
//  PortalGlyphkit
//
//  Created by garyrobertellis on 6/23/25.
//


import SwiftUI

public enum Glyph: String, CaseIterable, Equatable {
    case user, canvasAccess, settings, importLayer, exit, attention, successCheck
    
    public var image: Image {
        // Fallback-ready implementation
        switch self {
            case .user: return Image(systemName: "circle.dashed.inset.filled")
            // ... other glyphs ...
            case .attention: return Image(systemName: "exclamationmark.triangle.fill")
            case .successCheck: return Image(systemName: "checkmark")
        }
    }
}
// file: PortalGlyphKit/PortalGlyphSet.swift

import SwiftUI

/// Defines the type-safe, symbolic language for the Prismathos ecosystem.
/// By conforming to String and CaseIterable, it is ready for manifest mapping.
public enum Glyph: String, CaseIterable {
    case user
    case canvasAccess
    case settings
    case importLayer
    case exit
    case attention // For errors/static drift

    /// Provides the renderable SwiftUI Image for each glyph.
    /// This is where a fallback system could be implemented.
    public var image: Image {
        switch self {
        case .user:
            return Image(systemName: "circle.dashed.inset.filled")
        case .canvasAccess:
            return Image(systemName: "hexagon.lefthalf.filled")
        case .settings:
            return Image(systemName: "gearshape.2")
        case .importLayer:
            return Image(systemName: "arrow.down.forward.and.arrow.up.backward.circle")
        case .exit:
            return Image(systemName: "xmark.circle")
        case .attention:
            return Image(systemName: "exclamationmark.triangle.fill")
        }
    }
}
