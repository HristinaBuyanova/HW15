//
//  Model.swift
//  HW15
//
//  Created by Христина Буянова on 28.10.2023.
//

import Foundation

enum TypeCell {
    case standartType
    case switchType
    case notificationType
}

struct MVCModel {
    var title: String
    var discription: String?
    var image: String
    var typeCell: TypeCell
    var tintColor: String
}

extension MVCModel {
    static var array: [[MVCModel]] {
        return [
            [MVCModel(title: "Авиарежим", image: "airplane", typeCell: .switchType, tintColor: "myOrange"),
             MVCModel(title: "WI-FI", discription: "Не подключено", image: "wifi", typeCell: .standartType, tintColor: "myBlue"),
             MVCModel(title: "Bluetooth", discription: "Вкл.", image: "Bluetooth", typeCell: .standartType, tintColor: "myBlue"),
             MVCModel(title: "Сотовая связь", image: "antenna.radiowaves.left.and.right", typeCell: .standartType, tintColor: "myGreen"),
             MVCModel(title: "Режим модема", image: "personalhotspot", typeCell: .standartType, tintColor: "myGreen"),
             MVCModel(title: "VPN", image: "vpn", typeCell: .switchType, tintColor: "myBlue")],

            [MVCModel(title: "Уведомления", image: "bell.badge.fill", typeCell: .standartType, tintColor: "myRed"),
             MVCModel(title: "Звуки, тактильные сигналы", image: "speaker.wave.3.fill", typeCell: .standartType, tintColor: "myRed"),
             MVCModel(title: "Не беспокоить", image: "moon.fill", typeCell: .standartType, tintColor: "myViolet"),
             MVCModel(title: "Экранное время", image: "hourglass", typeCell: .standartType, tintColor: "myViolet")],

            [MVCModel(title: "Основные", image: "settings", typeCell: .notificationType, tintColor: "myGray"),
             MVCModel(title: "Пункт управления", image: "switch.2", typeCell: .standartType, tintColor: "myGray"),
             MVCModel(title: "Экран и яркость", image: "textformat.size", typeCell: .standartType, tintColor: "myBlue"),
             MVCModel(title: "Экран Домой", image: "square.grid.3x3.topleft.filled", typeCell: .standartType, tintColor: "myBlue"),
             MVCModel(title: "Универсальный доступ", image: "figure.2.circle", typeCell: .standartType, tintColor: "myBlue")]
        ]
    }
}
