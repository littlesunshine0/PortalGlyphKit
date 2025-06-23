// file: PortalGlyphKit/PortalGlyphSet.swift

import SwiftUI

/// A type-safe registry of all symbolic glyphs within the Prismathos ecosystem.
/// By making it an enum, we gain code completion, type safety, and a single source of truth.
public enum PortalGlyph: String, CaseIterable {
    // Core Glyphs
    case user
    case attention
    case exit
    
    // Fallback/Placeholder
    case fallback

    /// The renderable SwiftUI Image for each glyph.
    /// This is where the fallback rendering path (TODO #5) is implemented.
    public var image: Image {
        switch self {
        case .user:      return Image(systemName: "circle.dashed.inset.filled")
        case .attention: return Image(systemName: "exclamationmark.triangle.fill")
        case .exit:      return Image(systemName: "xmark.circle")
        case .fallback:  return Image(systemName: "questionmark.diamond")
        }
    }
}

// Namespace for clarity, aligning with your original vision.
public struct PortalGlyphSet {
    public typealias Glyph = PortalGlyph
}
