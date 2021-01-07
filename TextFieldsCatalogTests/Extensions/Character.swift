//
//  Character.swift
//  TextFieldsCatalogTests
//
//  Created by Александр Чаусов on 07.01.2021.
//  Copyright © 2021 Александр Чаусов. All rights reserved.
//

import XCTest
@testable import TextFieldsCatalog

final class CharacterTests: XCTestCase {

    // MARK: - Tests

    func testEmojiSymbols() {
        // given
        let symbols: [String] = [
            "😀", "😇", "🥰", "😙", "😋", "🤑", "🤗", "🤐", "😌", "😷", "🤠", "🧐", "😞", "🥱", "😤",
            "☠", "🤖", "😾", "🙊", "🖤", "💤",
            "🖖", "🤙", "☝", "🤜", "🙏", "🤳", "👄", "👩‍🦲", "👵", "🧏‍♂️", "👨‍🔧", "👸", "🧑‍🍼", "🧜‍♂️", "👨‍🦼", "🏄‍♂️", "🛌", "👣",
            "🦲", "🐴", "🦒", "🐻‍❄️", "🐊", "🐙", "🕷", "🌷", "🍃", "🥥", "🍄",
            "🌯", "🍱", "🦑", "🎂", "🍻", "🏺",
            "🌍", "🏟", "🗽", "🕋", "🎪", "🚔", "🚏", "🚧", "🚢", "🛸", "🛎", "⌛", "🌒", "❄",
            "🎉", "🎫", "🎖", "🎳", "🥌", "♟", "🎴", "🧶",
            "👚", "🎓", "💎", "🔕", "📻", "🥁", "📠", "🧮", "🪔", "🏷",
            "💹", "🗳", "📝", "✂", "🗑", "🗝", "🏹", "🧲", "📡", "🩺", "🧼", "🗿",
            "🏧", "⚠", "⬆", "🔝", "🔯", "🔀", "🔆", "✖", "❔", "💱", "♻", "™", "#️⃣", "7️⃣", "🔠", "🆙", "🔴", "🔶",
            "🏁", "🏳️‍🌈", "🏴‍☠️",
            "🇦🇨", "🇦🇿", "🇧🇴", "🇪🇦", "🇭🇲", "🇲🇬", "🇳🇫", "🇵🇫", "🇵🇷", "🇸🇴", "🇻🇬", "🇿🇼", "🏴󠁧󠁢󠁥󠁮󠁧󠁿", "🏴󠁧󠁢󠁳󠁣󠁴󠁿", "🏴󠁧󠁢󠁷󠁬󠁳󠁿",
            "🌶", "🆎", "🆔", "🆖", "🆗", "⏰", "🈲", "🈳", "🈴", "🈶", "⚧️"
        ]

        // when
        let notEmoji = symbols.filter { !$0.contains { $0.isEmoji } }

        // then
        XCTAssertTrue(notEmoji.isEmpty)
    }

    func testNotEmojiSymbols() {
        // given
        let symbols: [String] = [
            "&", "¡", "¶", "æ", "â", "E̵͉͈̥̝͛͊̂͗͊̈́̄͜", "ʩ", "Ξ", "Ѭ", "ᐄ", "᳀", "Ḁ", "Ṋ", "㉙", "1", "a", "㩸"
            // strange symbols, isEmoji == true, think about it
            // "֍", "۩", "௵", "⼽"
        ]

        // when
        let emoji = symbols.filter { $0.contains { $0.isEmoji } }

        // then
        XCTAssertTrue(emoji.isEmpty)
    }

}
