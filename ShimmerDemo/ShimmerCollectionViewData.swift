//
//  ShimmerCollectionViewData.swift
//  ShimmerDemo
//
//  Created by Ashish Badak on 25/01/23.
//

import Foundation

enum ShimmerType: CaseIterable {
    case topToBottom
    case topLeftToBottomRight
    case leftToRight
    case bottomLeftToTopRight
    case bottomToTop
    case bottomRightToTopLeft
    case rightToLeft
    case topRightToBottomLeft
    
    var title: String {
        switch self {
        case .topToBottom: return "Top To Bottom"
        case .topLeftToBottomRight: return "Top-Left To Bottom-Right"
        case .leftToRight: return "Left To Right"
        case .bottomLeftToTopRight: return "Bottom-Left To Top-Right"
        case .bottomToTop: return "Bottom To Top"
        case .bottomRightToTopLeft: return "Bottom-Right To Top-Left"
        case .rightToLeft: return "Right To Left"
        case .topRightToBottomLeft: return "Top-Right To Bottom-Left"
        }
    }
    
    var shimmerDirection: ShimmerDirection {
        switch self {
        case .topToBottom: return .topToBottom
        case .topLeftToBottomRight: return .topLeftToBottomRight
        case .leftToRight: return .leftToRight
        case .bottomLeftToTopRight: return .bottomLeftToTopRight
        case .bottomToTop: return .bottomToTop
        case .bottomRightToTopLeft: return .bottomRightToTopLeft
        case .rightToLeft: return .rightToLeft
        case .topRightToBottomLeft: return .topRightToBottomLeft
        }
    }
}
