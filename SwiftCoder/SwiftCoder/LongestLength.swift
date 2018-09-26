//
//  LongestLength.swift
//  SwiftCoder
//
//  Created by Kyle Thompson on 9/26/18.
//  Copyright © 2018 Kyle Thompson. All rights reserved.
//

import Foundation

// O(n2)
func lengthOfLongestSubstringA(_ s: String) -> Int {
    var winning = ""
    for i in stride(from: 0, to: s.count, by: 1) {
        var current = String(s[i])
        var last = s[i]
        for j in stride(from: i+1, to: s.count, by: 1) {
            if (s[j] != last && !current.contains(s[j]))
            {
                last = s[j]
                current.append(s[j])
            } else {
                break
            }
        }
        winning = winning.count >= current.count ? winning : current
    }
    
    return winning.count
}

// O(n)
func lenghtOfLongestSubstringB(_ s: String) -> Int {
    var smax = 0
    var currentMax = 0
    var startIndex = 0
    var chars = [Character : Int]()
    
    for i in stride(from: 0, to: s.count, by: 1) {
        let char = s[i]
        let index = chars[char]
        if (index != nil && index! >= startIndex) {
            currentMax = i - index! - 1
            startIndex = index!
        }
        chars[char] = i;
        currentMax += 1;
        
        smax = max(smax, currentMax);
    }
    
    return smax
}

// O(n) faster, and no string protocol
func lengthOfLongestSubstringC(_ s: String) -> Int {
    if s.count == 0 || s.count == 1{
        return s.count
    }
    
    var smax = 0
    var chars = [Character : Int]()
    var count = 0
    
    for (n,c) in s.enumerated(){
        if chars[c] == nil {
            chars[c] = n
            count += 1
        } else {
            count += 1
            count = min(count, n - chars[c]!)
            chars[c] = n
        }
        
        smax = max(smax, count)
    }
    
    return smax
}
