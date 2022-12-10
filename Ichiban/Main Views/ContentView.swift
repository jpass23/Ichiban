//
//  ContentView.swift
//  Ichiban
//
//  Created by Jaden Passero on 7/9/22.
//

import SwiftUI

struct ContentView: View {
    @State var serverList: [Server] = [Server(serverName: "No Server")]
    
    /// serverList if table.serverNum is set to optional
    //@State var serverList: [Server] = []
    
    var body: some View {
//        TabView{
//            ServerVew().tabItem { Text("Dining") }.tag(1)
//            HibachiView().tabItem { Text("Hibachi") }.tag(2)
//        }
//        .tabViewStyle(.page)
//        .indexViewStyle(.page(backgroundDisplayMode: .interactive))
//        .ignoresSafeArea()
        //HibachiView()
        //ServerView(serverList: $serverList)
        HibachiView(serverList: $serverList)
        //ServerView(serverList: $serverList)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
