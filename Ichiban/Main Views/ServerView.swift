//
//  ServerView.swift
//  Ichiban
//
//  Created by Jaden Passero on 7/14/22.
//

import SwiftUI

struct ServerView: View {
    @State var serverName: String = ""
    //@Binding var serverList: [Server]
    @Binding var serverList: [Server]
    
    
    var body: some View {
        
        ZStack {
            Color(red: 243/255, green: 242/255, blue: 247/255)
            VStack {

//                Text("Servers")
//                    .font(.title)
//                    .padding()

                NavigationView {
                    List {
                        ForEach(1..<serverList.count, id: \.self) { i in
                            NavigationLink{
                                ServerSpecsView(server: $serverList[i])
                            } label: {
                                HStack {
                                    Text(serverList[i].name)
                                    Spacer()
                                    Text("\(serverList[i].numTables)")
                                }
                            }
                            
                        }
                        .onDelete(perform: delete)
                        
                    }
                    .navigationTitle("Servers")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            EditButton()
                        }
                    }
                }
                Spacer()
                HStack {
                    TextField("Server Name", text: $serverName)
                        .onSubmit {
                            add(server: Server(serverName: serverName))
                            serverName = ""
                        }
                        .padding()
                    addButton
                }
            }
        }.frame(width: (UIScreen.main.bounds.size.width)/2, height: (UIScreen.main.bounds.size.height)/2)

    }
    
    var addButton: some View {
        Button("Add") {
            add(server: Server(serverName: serverName))
            serverName = ""
        }.padding()
    }
    func delete(at offsets: IndexSet) {
        serverList.remove(atOffsets: offsets)
    }
    func add(server: Server) {
        serverList.append(server)
    }
}

//struct ServerView_Previews: PreviewProvider {
//    static var previews: some View {
//        ServerView()
//    }
//}
