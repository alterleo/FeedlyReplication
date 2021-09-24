//
//  AllFeedsModel.swift
//  FeedlyReplication
//
//  Created by Alexander Konovalov on 23.09.2021.
//

import Foundation

struct Feed {
    let title: String
    let source: String
    let time: String
}

// Mock data
extension Feed {
    static func getMock() -> [Feed] {
        return [.init(title: "Как понять, что у организма снизился иммунитет", source: "Ferra.ru", time: "now"),
                .init(title: "Закрытие отрицательных остатков по счетам 60.01, 60.02, 62.01, 62.02", source: "Инфостарт - Все публикации", time: "now"),
                .init(title: "Press review: Will NATO collapse and why is Turkey rattling Russia over vote in Crimea", source: "TASS", time: "3min"),
                .init(title: "Melvin Van Peebles: 'Godfather of black cinema' dies at 89", source: "BBC News - World", time: "5min"),
                .init(title: "Учёные рассказали, как громкая музыка у соседей может травмировать вашу психику", source: "Ferra.ru", time: "7min"),
                .init(title: "Российские онлайн-магазины раскритиковали обязательную предустановку приложений на смартфоны", source: "Ferra.ru", time: "7min"),
                .init(title: "35 инструментов для веб-разработчика на каждый день", source: "Лучшие за сутки / Посты / Хабрахабр", time: "7min"),
                .init(title: "Ukraine's President Pleads With UN To 'Wake Up,' Help Resolve War", source: "Radio Free Europe / Radio Liberty", time: "13min"),
        ]
    }
}
