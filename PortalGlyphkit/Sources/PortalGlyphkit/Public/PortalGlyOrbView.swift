//
//  PortalGlyOrbView.swift
//  PortalGlyphkit
//
//  Created by garyrobertellis on 6/23/25.
//


import SwiftUI

public struct PortalGlyOrbView: View {
    public let state: OrbState
    public let style: GlassStyle
    
    // User initial for the "Alignment" state
    private let userInitial: Character?

    // For the idle "breathing" effect
    @State private var isBreathing = false

    public init(state: OrbState, style: GlassStyle = OrbStyles.standard) {
        self.state = state
        self.style = style
        if case .success(let initial) = state {
            self.userInitial = initial
        } else {
            self.userInitial = nil
        }
    }

    public var body: some View {
        ZStack {
            // Unpack state to drive opacity. Cleaner than multiple `if` statements.
            let (idleOpacity, loadingOpacity, errorOpacity, successOpacity) = opacities(for: state)
            let isFocused = isFocused(for: state)

            // Idle State Glyph
            if case .idle(let glyph, _) = state {
                glyph.image
                    .font(.system(size: 40, weight: .light))
                    .scaleEffect(isBreathing ? 1.0 : 0.98)
                    .shadow(color: .cyan.opacity(isFocused ? 0.4 : 0), radius: 15)
                    .opacity(idleOpacity)
            }

            // Loading State Spinner
            ProgressSpinnerView()
                .opacity(loadingOpacity)

            // Error State Glyph
            if case .error(let glyph) = state {
                glyph.image
                    .font(.system(size: 38, weight: .semibold))
                    .foregroundStyle(Color.red)
                    .shadow(color: .red.opacity(0.5), radius: 10)
                    .opacity(errorOpacity)
            }
            
            // Success State Morph
            if let initial = self.userInitial {
                Text(String(initial))
                    .font(.system(size: 48, weight: .bold, design: .rounded))
            } else {
                Glyph.successCheck.image
                    .font(.system(size: 40, weight: .bold))
            }
            // Animate scale separately for a better effect
            // We scale up the container, rather than the content.
            .opacity(successOpacity)
        }
        .frame(width: 80, height: 80)
        .glass(style: style, cornerRadius: 40) // A perfect circle
        .scaleEffect(state == .success(initial: userInitial) ? 1.1 : 1.0)
        // Animations
        .animation(.spring(response: 0.5, dampingFraction: 0.6), value: state)
        .animation(.spring(response: 0.4, dampingFraction: 0.5), value: isFocused)
        .onAppear(perform: setupBreathingAnimation)
    }

    // Helper functions for clarity
    private func opacities(for state: OrbState) -> (Double, Double, Double, Double) {
        switch state {
        case .idle: return (1, 0, 0, 0)
        case .loading: return (0, 1, 0, 0)
        case .error: return (0, 0, 1, 0)
        case .success: return (0, 0, 0, 1)
        }
    }
    
    private func isFocused(for state: OrbState) -> Bool {
        if case .idle(_, let isFocused) = state { return isFocused }
        return false
    }
    
    private func setupBreathingAnimation() {
        withAnimation(.easeInOut(duration: 3.0).repeatForever(autoreverses: true)) {
            isBreathing = true
        }
    }
}