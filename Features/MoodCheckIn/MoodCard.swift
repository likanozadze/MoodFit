//
//  MoodCard.swift
//  MoodFit
//
//  Created by Lika Nozadze on 16/11/2026.
//

import SwiftUI

struct MoodCard: View {
    let mood: Mood
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                Text(mood.title)
                    .font(.system(size: 15, weight: .heavy, design: .rounded))
                    .foregroundStyle(.white)
                    .lineLimit(2)
                    .minimumScaleFactor(0.7)

                Spacer(minLength: 0)

                Image(mood.imageName)
                    .resizable()
                    .renderingMode(.original)  
                    .scaledToFit()
                    .frame(width: 64, height: 56)
            }
            .padding(.horizontal, 14)
            .frame(maxWidth: .infinity)
            .frame(height: 76)
            .background(
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .fill(Color(white: isSelected ? 0.24 : 0.14))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .strokeBorder(isSelected ? Color.white : .clear, lineWidth: 2)
            )
        }
        .buttonStyle(.plain)
        .accessibilityLabel(mood.title)
    }
}

#Preview {
    MoodCard(mood: .anxious, isSelected: false) {}
        .padding()
        .background(Color.black)
}
