//
//  MoodCheckInView.swift
//  MoodFit
//
//  Created by Lika Nozadze on 16/11/2026.
//

import SwiftUI

enum Mood: String, CaseIterable, Identifiable, Hashable {
    case anxious, motivated, drained, energized
    case angry, calm, busy, down, satisfied, stressed
    
    var id: String { rawValue }
    var imageName: String { rawValue } 
    
    var title: String {
        self == .busy ? "Busy\nMinded" : rawValue.capitalized
    }
    
    var color: Color {
        switch self {
        case .anxious:   return .purple
        case .busy:      return .mint
        case .motivated: return .orange
        case .drained:   return Color(red: 154 / 255, green: 154 / 255, blue: 154 / 255)
        case .energized: return .yellow
        case .stressed:  return .pink
        case .satisfied: return .green
        case .down:      return .indigo
        case .calm:      return .blue
        case .angry:     return .red
        }
    }
}
