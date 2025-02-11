//
//  File.swift
//  
//
//  Created by Temur Khushvaktov on 18/11/24.
//

import Foundation

/// Configuration for setting constraints of fields
public struct LayoutConfiguration {

    let top: CGFloat
    let leading: CGFloat
    let trailing: CGFloat
    let bottom: CGFloat

    public init(top: CGFloat, leading: CGFloat, trailing: CGFloat, bottom: CGFloat) {
        self.top = top
        self.leading = leading
        self.trailing = trailing
        self.bottom = bottom
    }

}

/// Configuration for setting default layout for text field
public struct TextFieldLayoutConfiguration {

    let field: LayoutConfiguration
    let hint: LayoutConfiguration
    let action: LayoutConfiguration

    public init(field: LayoutConfiguration, hint: LayoutConfiguration, action: LayoutConfiguration) {
        self.field = field
        self.hint = hint
        self.action = action
    }

}


/// Configuration for setting default layout for text view
public struct TextViewLayoutConfiguration {

    let field: LayoutConfiguration
    let hint: LayoutConfiguration
    let action: LayoutConfiguration

    public init(field: LayoutConfiguration, hint: LayoutConfiguration, action: LayoutConfiguration) {
        self.field = field
        self.hint = hint
        self.action = action
    }

}

// MARK: - Default Implementation

public extension TextFieldLayoutConfiguration {

    static var `default`: Self {
        .init(
            field: .init(top: 18, leading: 16, trailing: -16, bottom: 0),
            hint: .init(top: 9, leading: 16, trailing: -16, bottom: 0),
            action: .init(top: 0, leading: 0, trailing: -16, bottom: 0)
        )
    }

}

public extension TextViewLayoutConfiguration {

    static var `default`: Self {
        .init(
            field: .init(top: 28, leading: 16, trailing: -16, bottom: 0),
            hint: .init(top: 9, leading: 16, trailing: -16, bottom: 0),
            action: .init(top: 0, leading: 0, trailing: 0, bottom: 0)
        )
    }

}
