//
//  EasyMemes.swift
//  EasyMemes
//
//  Created by Zoey Vu on 2021-03-26.
//

import Foundation

struct EasyMemes: Codable {
    var backgroundURL: URL?
    var emojis = [Emoji]()
    
    struct Emoji: Identifiable, Codable {
        let text: String
        var x: Int
        var y: Int // (0,0) in the center of the screen, as oppose to the upper left
        var size: Int
        let id: Int
        
        fileprivate init(text: String, x: Int, y: Int, size: Int, id: Int) {
            self.text = text
            self.x = x
            self.y = y
            self.size = size
            self.id = id
        }
    }
    
    init(json: Data?) {
        if json != nil, let newMeme = try? JSONDecoder().decole(easyMemes.self, from ) //here
    }
    
    var json: Data? {
        return try? JSONEncoder().encode(self)
    }
    
    private var uniqueEmojiId = 0
    
    mutating func addEmoji(_ text: String, x: Int, y: Int, size: Int) {
        uniqueEmojiId += 1
        emojis.append(Emoji(text: text, x: x, y: y, size: size, id: uniqueEmojiId))
    }
}
