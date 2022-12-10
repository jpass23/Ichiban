//
//  Timer.swift
//  Ichiban
//
//  Created by Jaden Passero on 7/12/22.
//

import SwiftUI

class StopWatchManager: ObservableObject{
    
    @Published var secondsElapsed = 0.0
    var timer = Timer()
    
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                self.secondsElapsed += 0.1
        }
    }
    
    func stop() {
        timer.invalidate()
        secondsElapsed = 0
    }
    
}
