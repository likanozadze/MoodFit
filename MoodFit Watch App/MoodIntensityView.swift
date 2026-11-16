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

struct VerticalIntensitySlider: View {
    @Binding var value: Double
    let color: Color

    var body: some View {
        GeometryReader { geo in
            let height = geo.size.height
            let width = geo.size.width
            let fillHeight = max(width, height * CGFloat(value))

            ZStack(alignment: .bottom) {

                Capsule()
                    .fill(Color(white: 0.20))

              
                Capsule()
                    .fill(color)
                    .frame(height: fillHeight)

    
                VStack {
                    ForEach(0..<5, id: \.self) { index in
                        Spacer()

                        if index == 1 {
                            Capsule()
                                .fill(Color.black.opacity(0.35))
                                .frame(width: 12, height: 3)
                        } else {
                            Circle()
                                .fill(Color.black.opacity(0.35))
                                .frame(width: 3, height: 3)
                        }
                    }

                    Spacer()
                }
            }
            .clipShape(Capsule())
            .contentShape(Rectangle())
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { gesture in
                        let normalized = 1.0 - (gesture.location.y / height)

                        value = min(
                            max(Double(normalized), 0.0),
                            1.0
                        )
                    }
            )
        }
    }
}

#Preview {
    NavigationStack {
        MoodIntensityView(mood: .anxious)
    }
}
