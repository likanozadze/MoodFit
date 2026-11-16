//
//  MoodCheckInView.swift
//  MoodFit
//
//  Created by Lika Nozadze on 16/11/2026.
//
import SwiftUI
import WatchKit

struct MoodCheckInView: View {
    let onSelect: (Mood) -> Void

    @State private var selected: Mood?

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text("How are you walking in?")
                    .font(.system(size: 20, weight: .black, design: .rounded))
                    .foregroundStyle(.white)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.horizontal, 4)

                VStack(spacing: 6) {
                    ForEach(Mood.allCases) { mood in
                        MoodCard(mood: mood, isSelected: selected == mood) {
                            selected = mood
                            WKInterfaceDevice.current().play(.click)
                            // short pause so the selected outline is visible
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                                onSelect(mood)
                            }
                        }
                    }
                }
            }
            .padding(.horizontal, 4)
        }
        .background(Color.black)
    }
}

#Preview {
    MoodCheckInView { _ in }
}
