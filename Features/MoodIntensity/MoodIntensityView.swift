//
//  MoodIntensityView.swift
//  MoodFit
//
//  Created by Lika Nozadze on 16/11/2026.
//


import SwiftUI
import WatchKit

struct MoodIntensityView: View {
    let mood: Mood

    @Environment(\.dismiss) private var dismiss

    @State private var intensity: Double = 0.25

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            HStack(spacing: 8) {
                VStack(spacing: 8) {
                    Spacer()

                    Image(mood.imageName)
                        .resizable()
                        .renderingMode(.original)
                        .scaledToFit()
                        .frame(width: 90, height: 75)

                    Text(mood.title.lowercased())
                        .font(.system(size: 16, weight: .heavy, design: .rounded))
                        .foregroundStyle(.white)

                    Spacer()

                    Button {
                        WKInterfaceDevice.current().play(.success)
                        dismiss()
                    } label: {
                        Text("Check in")
                            .font(.system(size: 14, weight: .semibold, design: .rounded))
                            .foregroundStyle(.white)
                            .padding(.horizontal, 18)
                            .padding(.vertical, 9)
                            .background(
                                Capsule()
                                    .fill(Color(white: 0.16))
                                    .overlay(
                                        Capsule().strokeBorder(
                                            Color(white: 0.28),
                                            lineWidth: 1
                                        )
                                    )
                            )
                    }
                    .buttonStyle(.plain)
                }
                .frame(maxWidth: .infinity)

                VerticalIntensitySlider(
                    value: $intensity,
                    color: mood.color
                )
                .frame(width: 34)
                .padding(.vertical, 6)
            }
            .padding(.horizontal, 6)
        }
        .focusable(true)
        .digitalCrownRotation(
            $intensity,
            from: 0.0,
            through: 1.0,
            by: 0.05,
            sensitivity: .medium,
            isContinuous: false,
            isHapticFeedbackEnabled: true
        )
    }
}



#Preview {
    NavigationStack {
        MoodIntensityView(mood: .anxious)
    }
}
