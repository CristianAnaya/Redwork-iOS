//
//  RolesView.swift
//  Presentation
//
//  Created by CRISTIAN ANAYA on 27/07/23.
//

import SwiftUI

struct RolesView: View {
    @EnvironmentObject private var viewModel: RolesViewModel

    var body: some View {
        VStack {
            CustomNavigationBar(title: "Selecciona tu rol")
            RolesContentView(viewModel: viewModel)
        }
    }
}

struct RolesView_Previews: PreviewProvider {
    static var previews: some View {
        RolesView()
    }
}
