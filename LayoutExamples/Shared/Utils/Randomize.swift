//
//  Randomize.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 03/06/24.
//

import Foundation

class Randomize {
    
    static func randomString(lenght: Int) -> String {
        randomByCharset("abcdefghijklmnpqrstuvwxyz", lenght: lenght)
    }
    
    static func randomNumber(lenght: Int) -> String {
        randomByCharset("1234567890", lenght: lenght)
    }
    
    static func randomArrayElement<Element>(_ array: [Element]) -> Element? {
        array.randomElement()
    }
    
    static func randomByCharset(_ charset: String, lenght: Int) -> String {
        let splitedCharset = charset.split(separator: "")
        var string = ""
        
        for _ in 0..<lenght {
            let randomPos = Int.random(in: 0..<splitedCharset.count)
            string += splitedCharset[randomPos]
        }
        
        return string
    }
}
