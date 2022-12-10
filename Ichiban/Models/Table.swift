//
//  Table.swift
//  Ichiban
//
//  Created by Jaden Passero on 7/9/22.
//

//import Foundation
import SwiftUI

class Table: ObservableObject {
    @Published var isSat: Bool = false
    @Published var isClosed: Bool = false
    @Published var color: Color = .white
    @Published var numberSat: Int = 0
    @Published var isCooking: Bool = false
    @Published var popUp: Bool = false
    @Published var serverNum: Int = 0
    @Published var serverName: String = ""
    @Published var maxNum: Int
    @Published var previousServerNum: Int = 0
    @Published var numLeft: Int = 0
    //@State var server: Server = Server(serverName: "Null")
    //@Published var time: Int = 0
    //@ObservedObject var stopWatch = StopWatchManager()
    //@Published var time = stopWatch.secondsElapsed
    //@Binding var serverList: [Server]
    
    
    let width = (UIScreen.main.bounds.size.width)/3
    let height = (UIScreen.main.bounds.size.height)/12
    var number: String
    let green = Color(red: 0.3, green: 0.8, blue: 0.25)
    
    init(tableNum:String, maxNum:Int){
        self.number = tableNum
        self.maxNum = maxNum
        self.numLeft = maxNum
        //self._serverList = servers
    }
    
    func clearTable(){
        //self.server.numPerTable.append(numberSat)
        self.isSat = false
        self.isClosed = false
        self.isCooking = false
        self.popUp = false
        self.numberSat = 0
        self.serverNum = 0
        self.serverName = ""
        self.previousServerNum = 0
        self.numLeft = self.maxNum
        self.color = .white
        
    }
    
    func sit(){
        self.isSat = true
        self.color = green
        
    }
}
