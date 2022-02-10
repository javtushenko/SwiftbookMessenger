//
//  MUser.swift
//  SwiftbookMessenger
//
//  Created by Николай Явтушенко on 10.02.2022.
//

import Foundation

struct MUser: Hashable, Decodable {
    
    var username: String
    var avatarStringURL: String
    var id: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: MUser, rhs: MUser) -> Bool {
        return lhs.id == rhs.id
    }
    
}
