//
//  RootView.swift
//  FetchiOSChallenge
//
//  Created by luane Niejelski on 6/25/23.
//

import SwiftUI

struct RootView: View {
    @AppStorage("showOnboarding") var showOnboarding: Bool = true
    
    var body: some View {
        NavigationStack {
            MealListView()
        }
        .accentColor(Color("PrimaryColor"))
        .sheet(isPresented: $showOnboarding) {
            OnboardingView(showOnboarding: $showOnboarding)
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
