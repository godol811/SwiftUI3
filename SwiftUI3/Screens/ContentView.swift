//
//  ContentView.swift
//  AsyncImage
//
//  Created by 고종찬 on 2021/12/29.
//

import SwiftUI




struct ContentView: View {
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
  //PROPERTY WRAPPER("USER DEFAULT KEY") var PROPERTYNAME = VALUE SET
    var body: some View {
        ZStack{
            if isOnboardingViewActive{
                OnboardingView()
            }else{
                HomeView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
