//
//  Infinity2.swift
//  Profile
//
//  Created by Vladimir on 03.07.2024.
//

import SwiftUI

struct OneOnTopTwoOnBottom: View {
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 15)
                .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                .foregroundColor(Color(.black))
            HStack {
                RoundedRectangle(cornerRadius: 15)
                    .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                    .foregroundColor(Color(.black))
                
                RoundedRectangle(cornerRadius: 15)
                    .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                    .foregroundColor(Color(.black))
            }
        }
        
    }
}
      
