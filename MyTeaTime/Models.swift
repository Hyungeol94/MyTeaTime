//
//  Models.swift
//  MyTeaTime
//
//  Created by Lyosha's MacBook   on 1/30/25.
//
import Foundation
import SwiftData

@Model
class TeaTimeBook: Identifiable, Hashable {
    @Attribute(.unique) var id: UUID
    var title: String
    var createdTime: Date
    @Relationship(deleteRule: .cascade, inverse: \Memo.teaTimeBook) var MemoArray: [Memo]
    var isFavorite: Bool
    
    init (title: String){
        self.id = UUID()
        self.title = title
        self.createdTime = Date()
        self.MemoArray = []
        self.isFavorite = false
    }
}

@Model
class Memo : Hashable {
    @Attribute(.unique) var id: UUID
    var teaTimeBook: TeaTimeBook?
    var title: String
    var createdTime: Date
    var content: String
    var imageName: String
    
    init(teaTimeBook: TeaTimeBook? = nil, title:String, content: String, imageName: String){
        self.teaTimeBook = teaTimeBook
        self.id = UUID()
        self.title = title
        self.createdTime = Date()
        self.content = content
        self.imageName = imageName
    }
}
