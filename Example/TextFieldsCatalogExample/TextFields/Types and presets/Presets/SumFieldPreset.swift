//
//  SumFieldPreset.swift
//  TextFieldsCatalogExample
//
//  Created by Александр Чаусов on 19/05/2020.
//  Copyright © 2020 Александр Чаусов. All rights reserved.
//

import UIKit
import TextFieldsCatalog

enum SumFieldPreset: CaseIterable, AppliedPreset {
    case sum

    var name: String {
        switch self {
        case .sum:
            return L10n.Presets.Sum.name
        }
    }

    var description: String {
        switch self {
        case .sum:
            return L10n.Presets.Sum.description
        }
    }

    func apply(for field: Any) {
        guard let field = field as? SumTextField else {
            return
        }
        apply(for: field)
    }

}

// MARK: - Tune

private extension SumFieldPreset {

    func apply(for textField: SumTextField) {
        switch self {
        case .sum:
            tuneFieldForSum(textField)
        }
    }

    func tuneFieldForSum(_ textField: SumTextField) {
        textField.placeholder = L10n.Presets.Sum.placeholder
        textField.field.autocorrectionType = .no
        textField.field.keyboardType = .decimalPad
        textField.maxLength = 14
        textField.configure(supportPlaceholder: "1\u{2009}000\u{2009}₽")
        textField.configure(currencyPlaceholder: "₽")

        let validator = TextFieldValidator(minLength: 1, maxLength: 14, regex: nil)
        textField.validator = validator

        textField.configureForSum()
    }

}
