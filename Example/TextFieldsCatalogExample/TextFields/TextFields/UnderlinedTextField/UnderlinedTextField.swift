//
//  UnderlinedTextField.swift
//  TextFieldsCatalogExample
//
//  Created by Александр Чаусов on 28/04/2020.
//  Copyright © 2020 Александр Чаусов. All rights reserved.
//

import TextFieldsCatalog
import UIKit

extension UnderlinedTextField {

    func setup(supportPlaceholder: String) {
        let config = NativePlaceholderConfiguration(font: UIFont.systemFont(ofSize: 16, weight: .regular),
                                                    height: 19,
                                                    insets: UIEdgeInsets(top: 23, left: 16, bottom: 0, right: 16),
                                                    colors: ColorConfiguration(color: Color.UnderlineTextField.placeholder),
                                                    behavior: .hideOnInput,
                                                    useAsMainPlaceholder: false,
                                                    increasedRightPadding: 16)
        let service = NativePlaceholderService(configuration: config)
        add(placeholderService: service)
        service.setup(placeholder: supportPlaceholder)
    }

}
