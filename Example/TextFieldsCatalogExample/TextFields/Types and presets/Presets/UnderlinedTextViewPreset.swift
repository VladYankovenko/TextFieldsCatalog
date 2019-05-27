//
//  UnderlinedTextViewPreset.swift
//  TextFieldsCatalogExample
//
//  Created by Александр Чаусов on 27/05/2019.
//  Copyright © 2019 Александр Чаусов. All rights reserved.
//

import UIKit
import TextFieldsCatalog

enum UnderlinedTextViewPreset: CaseIterable, AppliedPreset {
    case comment

    var name: String {
        switch self {
        case .comment:
            return "Комментарий"
        }
    }

    var description: String {
        switch self {
        case .comment:
            return "Поле ввода для какого-нибудь длинного комментария"
        }
    }

    func apply(for field: Any, with heightConstraint: NSLayoutConstraint) {
        guard let field = field as? UnderlinedTextView else {
            return
        }
        apply(for: field, heightConstraint: heightConstraint)
    }

}

// MARK: - Tune

private extension UnderlinedTextViewPreset {

    func apply(for textView: UnderlinedTextView, heightConstraint: NSLayoutConstraint) {
        switch self {
        case .comment:
            tuneFieldForComment(textView, heightConstraint: heightConstraint)
        }
    }

    func tuneFieldForComment(_ textView: UnderlinedTextView, heightConstraint: NSLayoutConstraint) {
        textView.configure(placeholder: "Комментарий", maxLength: nil)
        textView.configure(correction: .no, keyboardType: .default)
        textView.configure(heightConstraint: heightConstraint)
        textView.setHint("Напишите комментарий к заказу")
        textView.setReturnKeyType(.next)

//        let validator = TextFieldValidator(minLength: 8, maxLength: 20, regex: SharedRegex.password)
//        validator.shortErrorText = L10n.Presets.Password.shortErrorText
//        validator.largeErrorText = L10n.Presets.Password.largeErrorText(String(20))
//        textField.validator = validator

    }

}
