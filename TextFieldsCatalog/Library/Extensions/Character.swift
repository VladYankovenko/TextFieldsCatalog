//
//  Character.swift
//  TextFieldsCatalog
//
//  Created by Александр Чаусов on 07.01.2021.
//  Copyright © 2021 Александр Чаусов. All rights reserved.
//

extension Character {

    /**
     Returns true, if character is emoji, false in other case

     Warning: works only for ios higher than 10.2, for lower versions always returns false

     Recources for help:
        - https://stackoverflow.com/questions/30757193/find-out-if-character-in-string-is-emoji
        - https://medium.com/better-programming/understanding-swift-strings-characters-and-scalars-a4b82f2d8fde
     */
    var isEmoji: Bool {
        if #available(iOS 10.2, *) {
            let containsSpecificSymbols = unicodeScalars.contains { $0.properties.isJoinControl || $0.properties.isVariationSelector }
            let containsEmojiOrOtherSymbol = unicodeScalars.allSatisfy {
                $0.properties.isEmojiPresentation ||
                $0.properties.generalCategory == .otherSymbol
            }
            // 🏴󠁧󠁢󠁥󠁮󠁧󠁿, 🏴󠁧󠁢󠁳󠁣󠁴󠁿, 🏴󠁧󠁢󠁷󠁬󠁳󠁿
            let isCombinedIntoEmoji = unicodeScalars.count > 1 && unicodeScalars.first?.properties.isEmoji ?? false
            return [
                containsSpecificSymbols,
                containsEmojiOrOtherSymbol,
                isCombinedIntoEmoji
            ].contains(true)
        } else {
            return false
        }
    }

}
