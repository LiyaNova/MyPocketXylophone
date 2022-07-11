//
//  TapButtonProtocol.swift
//  MyPocketXylophone
//
//  Created by Юлия Филимонова on 07.07.2022.
//

import Foundation

protocol TapDelegate: AnyObject {
    func tapNote(musicNote: String)
}
