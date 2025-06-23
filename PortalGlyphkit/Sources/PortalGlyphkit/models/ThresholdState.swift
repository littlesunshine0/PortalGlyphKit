//
//  Threshold.swift
//  PortalGlyphkit
//
//  Created by garyrobertellis on 6/23/25.
//


// file: models/ThresholdState.swift (Extension)

import SwiftUI

extension ThresholdState {
    /// A computed helper to express if the chamber is in a focused state.
    /// This conforms to the GlassStateIntent philosophy (TODO #3).
    var isFocused: Bool {
        // This is a more robust check than the previous suggestion.
        if case .focused = self { return true }
        return false
    }
    
    // Include other state helpers here
    var isError: Bool {
        if case .error = self { return true }
        return false
    }
}