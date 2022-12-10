//
//  NumberSatView.swift
//  Ichiban
//
//  Created by Jaden Passero on 7/18/22.
//

import SwiftUI

struct NumberSatView: View {
    @ObservedObject var table: Table
    var numberList = [0,1,2,3,4,5,6,7,8,9,10]
    
    
    var body: some View {
        Picker(selection: $table.numLeft, label: Text("# Sat")) {
            
            ForEach(0 ..< numberList.count, id: \.self) { index in
                Text("\(numberList[index])").tag(index)
            }
        }.pickerStyle(.wheel)
    }
}

//struct NumberSatView_Previews: PreviewProvider {
//    static var previews: some View {
//        NumberSatView()
//    }
//}
