//
//  ContentView.swift
//  onlineAnytime
//
//  Created by Sophie on 3/8/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var showMenu: Bool = false
    
    var body: some View {
        let drag = DragGesture()
            .onEnded {
                if $0.translation.width < -100 {
                    withAnimation {
                        self.showMenu = false
                    }
                }
            }
        
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                HomeView(showMenu: self.$showMenu)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .offset(x: self.showMenu ? geometry.size.width * 2 / 3 : 0)
                    .disabled(self.showMenu ? true : false)
                if self.showMenu {
                    MenuView().frame(width: geometry.size.width * 2 / 3)
                        .transition(.move(edge: .leading))
                }
            }.gesture(drag)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
