//
//  EasyMemesApp.swift
//  EasyMemes
//
//  Created by Zoey Vu on 2021-03-26.
//

import SwiftUI

@main
struct EasyMemesApp: App {
    var body: some Scene {
        WindowGroup {
            EasyMemesDocumentView(document: EasyMemesDocument())
        }
    }
}
