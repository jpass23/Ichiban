//
//  ServerSpecsView.swift
//  Ichiban
//
//  Created by Jaden Passero on 7/18/22.
//

import SwiftUI


struct ServerSpecsView: View {
    @Binding var server: Server
    
    var body: some View {
        VStack {
            List{
                ForEach(0..<server.tablesSat.count, id: \.self) { i in
                    
                    HStack {
                        Text(server.tablesSat[i])
                        Spacer()
                        let numPerTable = ((server.numPerTable.count-1) >= i ? String(server.numPerTable[i]) : "")
                        Text(numPerTable)
                    }
                }
            }
            Spacer()
            HStack {
                Text("Total:").font(.headline).fontWeight(.bold)
                Spacer()
                Text(String(server.numPerTable.reduce(0, +))).font(.headline)
            }.padding()
        }
    }
}

//struct ServerSpecsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ServerSpecsView()
//    }
//}
