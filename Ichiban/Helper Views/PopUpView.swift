//
//  EmptyPopUpView.swift
//  Ichiban
//
//  Created by Jaden Passero on 7/10/22.
//

import SwiftUI

struct PopUpView: View {
    
    @Binding var servers: [Server]
    //@State var serverSelection: Int = 50
    @Binding var showAlert: Bool
    @ObservedObject var table: Table
    @ObservedObject var stopWatch: StopWatchManager
    @State var serverAlert = false
    
    var body: some View{
        VStack {
            //Spacer()
            Text("Choose Server")
                .font(.title)
                .padding()
            
            Picker(selection: $table.serverNum, label: Text("Choose Server")) {
                
                
                //Text("Nothing").tag(nil as Int?)
                ForEach(0 ..< servers.count, id: \.self) { index in
                    Text("\(servers[index].name)").tag(index as Int?)
                }
                
                ///Picker when table.serverNum is null
//                Text("Nothing").tag(nil as Int?)
//                ForEach(0 ..< servers.count, id: \.self) { index in
//                    Text("\(servers[index].name)").tag(index as Int?)
//                }
            }.pickerStyle(.wheel)
                .onChange(of: table.serverNum){ value in
                    if table.serverNum != 0{
                        serverAlert = true
                    }
                    print(table.serverName)
                }.alert("Assign table \(table.number) to \(servers[table.serverNum].name)?", isPresented: $serverAlert) {
                    Button("Yes") {
                        servers[table.previousServerNum].numTables -= 1
                        table.previousServerNum = table.serverNum
                        table.serverName = servers[table.serverNum].name
                        //table.server = servers[table.serverNum]
                        servers[table.serverNum].numTables += 1
                        servers[table.serverNum].tablesSat.append(table.number)
                        table.popUp = false
                    }
                    Button("No", role: .cancel) {
                        //table.serverNum = table.previousServerNum
                        serverAlert = false
                    }
                }
            
            ///Alert for when table.serverNum is set to optional
//                .alert("Assign table \(table.number) to \(servers[table.serverNum ?? 0].name)?", isPresented: $serverAlert) {
//                    Button("Yes") {
//                        servers[table.previousServerNum].numTables -= 1
//                        table.previousServerNum = table.serverNum!
//                        table.serverName = servers[table.serverNum!].name
//                        //table.server = servers[table.serverNum]
//                        servers[table.serverNum!].numTables += 1
//                        servers[table.serverNum!].tablesSat.append(table.number)
//                        table.popUp = false
//                    }
//                    Button("No", role: .cancel) {
//                        //table.serverNum = table.previousServerNum
//                        serverAlert = false
//                    }
//                }

            Button {
                showAlert = true
            } label: {
                Text("Clear Table").foregroundColor(.red).padding()
            }.alert("Are you sure you want to clear table \(table.number)?", isPresented: $showAlert) {
                Button("Yes") {
                    //servers[table.serverNum].numPerTable.append(table.numberSat)
                    stopWatch.stop()
                    table.clearTable()
                    showAlert = false
                }
                Button("Cancel", role: .cancel) { }
            }
        }
    }
}
