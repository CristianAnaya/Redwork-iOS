//
//  SplashView.swift
//  Presentation
//
//  Created by CRISTIAN ANAYA on 21/07/23.
//

import SwiftUI

struct SplashView: View  {
    
    @EnvironmentObject private var viewModel: SplashViewModel

    var body: some View {
        ZStack(alignment: .center) {
            GetSession(viewModel: viewModel)
        }
        
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
