//
//  Hibachi View.swift
//  Ichiban
//
//  Created by Jaden Passero on 7/9/22.
//

import SwiftUI


struct HibachiView: View {
    
    @State var showServers = false
    @Binding var serverList: [Server]
    
    var body: some View {

        ZStack{
            Color.black
            
            VStack{
                
                Spacer()
                Spacer()
                HStack{
                    Spacer()
                    TableView(tableNumber: "H1", maxNum: 9, servers: $serverList)
                    Spacer()
                    TableView(tableNumber: "H3", maxNum: 9, servers: $serverList)
                    Spacer()
                }
                HStack{
                    Spacer()
                    TableView(tableNumber: "H2", maxNum: 9, servers: $serverList)
                    Spacer()
                    TableView(tableNumber: "H4", maxNum: 9, servers: $serverList)
                    Spacer()
                }
                //Spacer()
                HStack{
                    Spacer()
                    TableView(tableNumber: "H5", maxNum: 9, servers: $serverList)
                    Spacer()
                    TableView(tableNumber: "H7", maxNum: 9, servers: $serverList)
                    Spacer()
                }
                HStack{
                    Spacer()
                    TableView(tableNumber: "H6", maxNum: 9, servers: $serverList)
                    Spacer()
                    TableView(tableNumber: "H8", maxNum: 9, servers: $serverList)
                    Spacer()
                }
                Rectangle()
                    .fill(.white)
                    .frame(width: UIScreen.main.bounds.size.width, height: 5)
                    .padding()
                HStack{
                    Spacer()
                    TableView(tableNumber: "H61", maxNum: 10, servers: $serverList)
                    Spacer()
                    TableView(tableNumber: "H62", maxNum: 10, servers: $serverList)
                    Spacer()
                }
                HStack{
                    Spacer()
                    TableView(tableNumber: "H63", maxNum: 10, servers: $serverList)
                    Spacer()
                    TableView(tableNumber: "H64", maxNum: 10, servers: $serverList)
                    Spacer()
                }
                Spacer()
            }
            VStack {
                HStack { // Title
                    Spacer()
                    Text("Hibachi Seating")
                        .font(.system(size: 80))
                        .foregroundColor(.white)
                        .padding()
                    Spacer()
                }
                Spacer()
            }
            VStack{
                HStack{
                    Spacer()
                    Button {
                        showServers = true
                    } label: {
                        Text("Servers")
                            .bold()
                            .padding()
                            .frame(width: 150, height: 60)
                    }.popover(isPresented: $showServers) {
                        ServerView(serverList: $serverList)
                    }
                }
                Spacer()
            }
        }
    }
}

