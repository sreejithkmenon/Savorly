//
//  ColorExtension.swift
//  Savorly
//
//  Created by Sreejith K Menon on 08/11/23.
//

import SwiftUI

extension Color {
    /// Initializes a SwiftUI Color using a hexadecimal color code.
    ///
    /// - Parameter hex: A hexadecimal color string that can be in 3, 6, or 8 digits representing RGB, RGB, and ARGB formats respectively.
    ///
    /// This initializer first removes any non-alphanumeric characters from the input string.
    /// It then parses the hexadecimal string into an integer and extracts the color components based on the length of the hexadecimal string.
    ///
    /// Assumptions:
    /// - The input string is a valid hexadecimal color code, without hash symbol.
    /// - For 3-digit hex codes, each digit is replicated to form a 6-digit code (e.g., '123' becomes '112233').
    /// - For unsupported hex code lengths, a default transparent color is returned.
    ///
    /// Supported formats:
    /// - 3 digits: RGB (12-bit), repeated to form 6-digit equivalent.
    /// - 6 digits: RGB (24-bit).
    /// - 8 digits: ARGB (32-bit).
    ///
    /// For example:
    /// - "FFF" will be interpreted as "FFFFFF" (white color).
    /// - "FF0000" represents red color.
    /// - "80FF0000" represents red color with 50% opacity.
    ///
    /// In case of invalid or unsupported string lengths, the default color is nearly transparent black.
    ///
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            // Each hex digit is replicated to form a 6-digit equivalent.
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            // Standard RGB format with no alpha value (fully opaque).
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            // Includes alpha for opacity.
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            // Default to nearly transparent black for unsupported formats.
            (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

