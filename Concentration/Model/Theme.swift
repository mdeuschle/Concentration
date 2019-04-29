//
//  Theme.swift
//  Concentration
//
//  Created by Matt Deuschle on 4/28/19.
//  Copyright © 2019 Matt Deuschle. All rights reserved.
//

import Foundation

struct Theme {
    
    static let shared = Theme()
    private init() {}
    
    enum Style: Int {
        case halloween
        case love
        case animal
        case waterCreatures
        case plants
        case weather
    }
    
    func getThemes() -> [String] {
        let randomInt = arc4random_uniform(UInt32(Style.weather.rawValue))
        let style = Theme.Style(rawValue: Int(randomInt)) ?? Style.halloween
        switch style {
        case .halloween:
            return ["👻", "😈", "👹", "👺", "🎃", "☠️", "🦇", "💀"]
        case .love:
            return ["💕","💋", "💌", "💘", "❤️", "💓", "💖", "💔"]
        case .animal:
            return ["🐶", "🐒", "🐔", "🦊", "🦉", "🐭", "🐥", "🦎"]
        case .waterCreatures:
            return ["🦑", "🐙", "🐠", "🐡", "🐳", "🐚", "🦀", "🦈"]
        case .plants:
            return ["🍁", "🍄", "🌹", "💐", "🌾", "🌸", "🌺", "🌻"]
        case .weather:
            return ["❄️", "☀️", "💦", "☔️", "🌬", "☁️", "🌪", "⛈"]
        }
    }
}



