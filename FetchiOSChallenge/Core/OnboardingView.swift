//
//  OnboardingView.swift
//  FetchiOSChallenge
//
//  Created by luane Niejelski on 6/25/23.
//

import SwiftUI

struct OnboardingView: View {
    @Binding var showOnboarding: Bool
    let continueButton = "Continue"
    
    var body: some View {
        VStack {
            Spacer()
            Text("Welcome to The Meal app!")
                .font(.title)
                .foregroundColor(Color("PrimaryColor"))
                .padding()
            Image("OnboardingIcon")
                .resizable()
                .frame(width: 150, height: 160)
                .background(Color.clear)
            
            Spacer()
            Button {
                showOnboarding = false
            } label: {
                Text(continueButton)
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color("OrangeColor"))
                    .cornerRadius(10)
                    .padding(40)
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(showOnboarding: .constant(true))
    }
}
