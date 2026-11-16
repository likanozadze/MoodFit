//
//  MoodCheckInView.swift
//  MoodFit
//
//  Created by Lika Nozadze on 16/11/2026.
//

import SwiftUI
import WatchKit

enum Mood: String, CaseIterable, Identifiable {
    case anxious, motivated, drained, energized
    case angry, calm, busy, down, satisfied, stressed

    var id: String { rawValue }
    var title: String { rawValue.capitalized }
    var imageName: String { rawValue }
}

