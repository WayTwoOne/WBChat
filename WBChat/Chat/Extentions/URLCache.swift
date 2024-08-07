//
//  URLCache.swift
//  WBChat
//
//  Created by Vladimir on 07.08.2024.
//

import Foundation
import SwiftUI

extension URLCache {
    static let imageCache = URLCache(
        memoryCapacity: 512.megabytes(),
        diskCapacity: 2.gigabytes()
    )
}

private extension Int {
    func kilobytes() -> Int {
        self * 1024 * 1024
    }

    func megabytes() -> Int {
        self.kilobytes() * 1024
    }

    func gigabytes() -> Int {
        self.megabytes() * 1024
    }
}

extension View {
    func viewSize(_ size: CGFloat) -> some View {
        self.frame(width: size, height: size)
    }

    func circleBackground(_ color: Color) -> some View {
        self.background {
            Circle().fill(color)
        }
    }

    @ViewBuilder
    func applyIf<T: View>(_ condition: Bool, apply: (Self) -> T) -> some View {
        if condition {
            apply(self)
        } else {
            self
        }
    }
}
