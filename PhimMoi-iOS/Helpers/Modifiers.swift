//
//  Modifiers.swift
//  PhimMoi-iOS
//
//  Created by ドロケ on 18/09/2022.
//

import Foundation
import SwiftUI

struct FeatureTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 20, weight: .bold, design: .rounded))
    }
}

struct CategogyTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 18, weight: .bold, design: .rounded))
    }
}


