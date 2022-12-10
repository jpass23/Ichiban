//
//  TableView.swift
//  Ichiban
//
//  Created by Jaden Passero on 7/10/22.
//

import SwiftUI

struct TableView: View {
    //@State var tableNumber: String = ""
    @ObservedObject var table: Table
    @ObservedObject var stopWatch = StopWatchManager()
    @State var showAlert = false
    @Binding var serverList: [Server]
    @State var numSatPopUp = false
    
    init(tableNumber: String, maxNum: Int, servers: Binding<[Server]>) {
        table = Table(tableNum: tableNumber,maxNum: maxNum)
        self._serverList = servers
    }
    
    var body: some View {
        HStack {
//            VStack{ //Side Chairs
//                Circle()
//                    .frame(width: table.height/4, height: table.height/4)
//
//                Circle()
//                    .frame(width: table.height/4, height: table.height/4)
//                    .padding()
//                Circle()
//                    .frame(width: table.height/4, height: table.height/4)
//            }
            
            VStack {
               
//                HStack{ //Top Chairs
//                    Circle()
//                        .frame(width: table.height/4, height: table.height/4)
//                        .padding()
//                    Circle()
//                        .frame(width: table.height/4, height: table.height/4)
//                        .padding()
//                    Circle()
//                        .frame(width: table.height/4, height: table.height/4)
//                        .padding()
//                    Circle()
//                        .frame(width: table.height/4, height: table.height/4)
//                        .padding()
//                }
                
                
                HStack {
                    // Minus button
                    Button {
                        if table.numberSat == 1{
                            showAlert = true
                        }else if table.numberSat > 0{
                            //table.isClosed = false
                            table.numberSat -= 1
                            table.numLeft += 1
                        }
                        //print(table.numberSat)
                    } label: {
                        ZStack{
                            Rectangle()
                                .fill(table.color)
                                .frame(width: table.width/4.5, height: table.height)
                            Text("-")
                        }
                    }.alert("Are you sure you want to clear table \(table.number)?", isPresented: $showAlert) {
                        Button("Yes") {
                            //serverList[table.serverNum].numPerTable.append(table.numberSat)
                            stopWatch.stop()
                            table.clearTable()
                            showAlert = false
                        }
                        Button("Cancel", role: .cancel) { }
                    }
                    
                    
                    ZStack { //Middle section
                        Rectangle()
                            .fill(table.color)
                            .frame(width: CGFloat(table.width/2), height: table.height)
                        VStack{
                            HStack{ //Toggles
                                Toggle(isOn: $table.isClosed) {} //Closes table
                                    .labelsHidden()
                                    .onChange(of: table.isClosed) { value in
                                        if table.isClosed && !table.isCooking{
                                            table.color = .gray
                                        }else if table.isClosed && table.isCooking{
                                            table.color = .orange
                                        }else if table.isSat && !table.isClosed && !table.isCooking{
                                            table.color = table.green
                                        }else{
                                            table.isCooking = false
                                        }
                                    }
                                Toggle(isOn: $table.isCooking) {}//Cooks table
                                    .labelsHidden()
                                    .onChange(of: table.isCooking) { value in
                                        let currentServer = serverList[table.serverNum]
                                        let index = Int(currentServer.tablesSat.lastIndex(of: table.number) ?? 0)
                                        //print(index)
                                        
                                        if table.isCooking{
                                            currentServer.numPerTable[index] = table.numberSat
                                            table.isClosed = true
                                            table.color = .orange
                                        }else if table.isClosed{
                                            table.color = .gray
                                        }else if table.isSat{
                                            table.color = table.green
                                        }else{
                                            table.color = .white
                                        }
                                    }
                            }
                            
                            Button { // Pop Up button
                                //print(table.serverName)
                                table.popUp = true
                            } label: {
                                VStack{
                                    Text(table.number)
                                    Text("\(Int(stopWatch.secondsElapsed)/60) m: \(Int(stopWatch.secondsElapsed)%60) s")
                                }.foregroundColor(.black)
                            }
                            .popover(isPresented: $table.popUp) {
                                PopUpView(servers: $serverList, showAlert: $showAlert, table: table, stopWatch: stopWatch)
                            }
                        }
                    }.padding(-8.0)
                    
                    
                    
                    Button { // Plus Button
                        if !table.isSat{
                            stopWatch.start()
                            //table.isSat = true
                            table.sit()
                        }
                        if table.numLeft > 1{
                            table.numberSat += 1
                            table.numLeft -= 1
                        }else if table.numLeft == 1{
                            table.numLeft -= 1
                            table.numberSat += 1
                            table.isClosed = true
                        }
                        //print(table.numberSat)
                    } label: {
                        ZStack{
                            Rectangle()
                                .fill(table.color)
                                .frame(width: table.width/4.5, height: table.height)
                            Text("+")
                        }
                    }
                }
                
                HStack { //Progress bar and #sat and #left
                    Text("\(table.numberSat) sat").foregroundColor(.white)
                    ProgressView(value: Float(table.maxNum-table.numLeft)/Float(table.maxNum)).background(Color.init(red: 0.25, green: 0.25, blue: 0.25)).frame(width: table.width/1.6)
                    Button {
                        numSatPopUp = true
                    } label: {
                        if table.isSat {
                            Text("\(table.numLeft) left").fontWeight(.heavy).foregroundColor(.yellow)
                        }else{
                            Text("\(table.numLeft) left").foregroundColor(.white)
                        }
                    }.popover(isPresented: $numSatPopUp){
                        NumberSatView(table: table)
                    }
                }
            }
        }
        .padding(.horizontal, 10.0)
    }
}

//struct DiningTableView_Previews: PreviewProvider {
//    static var previews: some View {
//        TableView(tableNumber: "H1",maxNum: 9)
//    }
//}
