//
//  EasyMemesDocument.swift
//  EasyMemes
//
//  Created by Zoey Vu on 2021-03-26.
//

import SwiftUI

class EasyMemesDocument: ObservableObject {
    
    static let palette: String = "👌🙈☘️🌴"
    
    @Published private var easyMemes: EasyMemes = EasyMemes() {
        willSet {
            objectWillChange.send()
        }
        didSet {
            UserDefaults.standard.set(easyMemes.json, forKey: "easyMemesDocument.Untitled")
        }
    }
    
    @Published private(set) var backgroundImage: UIImage?
    
    var emojis: [EasyMemes.Emoji] { easyMemes.emojis }
    
    // MARK: - Intent(s)
    
    func addEmoji(_ emoji: String, at location: CGPoint, size: CGFloat) {
        easyMemes.addEmoji(emoji, x: Int(location.x), y: Int(location.y), size: Int(size))
    }
    
    func moveEmoji(_ emoji: EasyMemes.Emoji, by offset: CGSize) {
        if let index = easyMemes.emojis.firstIndex(matching: emoji) {
            easyMemes.emojis[index].x += Int(offset.width)
            easyMemes.emojis[index].y += Int(offset.height)
        }
    }
    
    func scaleEmoji( _ emoji: EasyMemes.Emoji, by scale: CGFloat) {
        if let index = easyMemes.emojis.firstIndex(matching: emoji) {
            easyMemes.emojis[index].size = Int((CGFloat(easyMemes.emojis[index].size) * scale).rounded(.toNearestOrEven))
            }
    }
    
    func setBackgroundURL(_ url: URL?) {
        easyMemes.backgroundURL = url?.imageURL
        fetchBackgroundImageData()
    }
    
    private func fetchBackgroundImageData() {
        backgroundImage = nil
        if let url = self.easyMemes.backgroundURL {
            DispatchQueue.global(qos: .userInitiated).async {
                if let imageData = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        self.backgroundImage = UIImage(data: imageData)
                    }
                }
            }
        }
    }
}

extension EasyMemes.Emoji {
    var fontSize: CGFloat { CGFloat(self.size) }
    var location: CGPoint { CGPoint(x: CGFloat(x), y : CGFloat(y))}
}
