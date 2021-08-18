//
//  TextFieldValidation.swift
//  TextFieldsCatalog
//
//  Created by Александр Чаусов on 28/01/2019.
//  Copyright © 2019 Александр Чаусов. All rights reserved.
//

import Foundation

public protocol TextFieldValidation: AnyObject {
    func validate(_ text: String?) -> (isValid: Bool, errorMessage: String?)
}
