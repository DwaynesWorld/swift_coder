//
//  LongestPalindrome.swift
//  SwiftCoder
//
//  Created by Kyle Thompson on 9/26/18.
//  Copyright © 2018 Kyle Thompson. All rights reserved.
//

import Foundation

// O(n3)
func longestPalindromeA(_ s: String) -> String {
    if s.count == 0 || s.count == 1 {
        return s
    }
    
    let s = Array(s)
    var max = ""
    
    for i in 0..<s.count {
        
        var current = String(s[i])
        
        if current.count > max.count {
            max = current
        }
        
        for j in (i+1)..<(s.count) {
            current.append(s[j])
            if current == String(current.reversed()) {
                if current.count > max.count {
                    max = current
                }
            }
        }
        
        if max.count == s.count {
            return max
        }
    }
    
    return max
}

// O(n2)
func longestPalindromeB(_ s : String) -> String {
    let count = s.count
    let row = [Bool](repeating: false, count: count)
    var table = [[Bool]](repeating: row, count: count)

    if count == 0 || count == 1 {
        return s
    }
    
    let s = Array(s)
    
    var maxlength = 1
    var maxPalindrome = String(s[0])
    
    // 1 Characters
    for i in 0..<count {
        table[i][i] = true
    }
    
    // 2 Characters
    for i in 0..<(count - 1) {
        if (s[i] == s[i + 1]) {
            table[i][(i+1)] = true
            
            let palindrome = s[i...(i+1)]
            let length = palindrome.count
            
            if (length > maxlength) {
                maxPalindrome = String(palindrome)
                maxlength = length
            }
        }
    }
    
    // Everything else
    for k in 1..<count {
        for i in 0..<(count - k) {
            let j = i + k
            if (s[i] == s[j] && table[i+1][j-1] == true) {
                let palindrome = s[i...j]
                let length = palindrome.count
                
                if (length > maxlength) {
                    maxPalindrome = String(palindrome)
                    maxlength = length
                }
                
                table[i][j] = true
            }
        }
    }
    
    return maxPalindrome
}
