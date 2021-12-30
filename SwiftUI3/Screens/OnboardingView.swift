//
//  OnboardingView.swift
//  SwiftUI3
//
//  Created by 고종찬 on 2021/12/30.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: - PROPERTY
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
    var body: some View {
        VStack (spacing:20){
            Text("Onboarding")
                .font(.largeTitle)
            Button(action: {
                isOnboardingViewActive = false
                //Some action
                
                
            }){
                Text("Start")
            }
        }// :VStack
       
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
