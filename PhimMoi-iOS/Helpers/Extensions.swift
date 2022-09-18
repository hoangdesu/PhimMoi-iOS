//
//  Extensions.swift
//  PhimMoi-iOS
//
//  Created by ドロケ on 18/09/2022.
//

import Foundation

extension String {
    func isValidatedEmail(_ string: String) -> Bool {
        if string.count > 100 {
            return false
        }
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}" // short format
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: string)
    }
}
