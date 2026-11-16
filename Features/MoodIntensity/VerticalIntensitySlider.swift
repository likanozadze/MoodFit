//
//  VerticalIntensitySlider.swift
//  MoodFit
//
//  Created by Lika Nozadze on 16/11/2026.
//

import SwiftUI
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
