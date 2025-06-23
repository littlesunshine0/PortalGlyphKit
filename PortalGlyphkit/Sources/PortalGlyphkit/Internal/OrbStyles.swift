//
//  OrbStyles.swift
//  PortalGlyphkit
//
//  Created by garyrobertellis on 6/23/25.
//


import SwiftUI

// This uses the GlassStyle we defined earlier.
// Ensure GlassStyle.swift is also part of this package target.

internal enum OrbStyles {
    /// The standard, default appearance for the orb.
    static let standard = GlassStyle(
        tint: .white.opacity(0.1),
        thickness: 0.4,
        noise: 0.015,
        edge: .subtle(color: .white.opacity(0.5))
    )

    /// A more prominent, glowing style for highlighted contexts.
    static let radiant = GlassStyle(
        tint: .cyan.opacity(0.2),
        thickness: 0.6,
        noise: 0.02,
        edge: .subtle(color: .cyan.opacity(0.8), width: 1.5)
    )
}