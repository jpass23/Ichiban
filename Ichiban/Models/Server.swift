//
//  Server.swift
//  Ichiban
//
//  Created by Jaden Passero on 7/14/22.
//

import Foundation
import SwiftUI

class Server: ObservableObject{
    @Published var name: String
    @Published var numTables = 0
    @Published var tablesSat: [String] = []
    @Published var numPerTable: [Int] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    
    init(serverName: String){
        self.name = serverName
    }
    
}
