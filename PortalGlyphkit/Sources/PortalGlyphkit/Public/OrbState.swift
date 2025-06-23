//
//  OrbState.swift
//  PortalGlyphkit
//
//  Created by garyrobertellis on 6/23/25.
//


import SwiftUI

/// Defines the visual and semantic state of the PortalGlyOrbView.
/// This is decoupled from application-specific logic for maximum reusability.
public enum OrbState: Equatable {
    /// Idle, awaiting interaction. Shows a specific glyph.
    case idle(glyph: Glyph, isFocused: Bool = false)
    
    /// Actively processing or listening.
    case loading
    
    /// A terminal success state. Shows the user's initial or a fallback glyph.
    case success(initial: Character?)
    
    /// A terminal error state. Shows a specific glyph.
    case error(glyph: Glyph)
}