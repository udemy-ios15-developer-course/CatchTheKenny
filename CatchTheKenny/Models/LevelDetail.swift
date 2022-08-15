//
//  LevelDetail.swift
//  CatchTheKenny
//
//  Created by Chris Hand on 8/14/22.
//
import Foundation

struct LevelDetail: Codable, Hashable, Identifiable {
    var id: Int
    var level: Int
    var speed: Int
    var duration: Int
    var pattern: Int
}
