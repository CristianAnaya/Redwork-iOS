//
//  RolesContentView.swift
//  Presentation
//
//  Created by CRISTIAN ANAYA on 27/07/23.
//

import SwiftUI

struct RolesContentView: View {
    @ObservedObject var viewModel: RolesViewModel

    var body: some View {
        VStack {
            Spacer().frame(height: 40)
            Text("Dinos que eres!")
                .font(FontManager.mediumHeadLine_2)
            
            Spacer().frame(height: 30)
            
            HStack(spacing: 40) {
                RoleButtonComponent(
                    image: "icon_client",
                    title: "Soy cliente",
                    destination: AnyView(RegisterClientView()
                        .environmentObject(
                            DependencyInjectionContainer.shared.resolve(
                                RegisterWorkerViewModel.self,
                                argument1: viewModel.phone,
                                argument2: "CLIENT"
                            )!
                        )
                    )
                )

                RoleButtonComponent(
                    image: "icon_worker",
                    title: "Soy profesional",
                    destination: AnyView(RegisterWorkerView()
                        .environmentObject(
                            DependencyInjectionContainer.shared.resolve(
                                RegisterWorkerViewModel.self,
                                argument1: viewModel.phone,
                                argument2: "WORKER"
                            )!
                        )
                    )
                )
            }
            Spacer()
            HStack {
                Image("decide_client_or_professional")
                    .resizable()
                    .frame(width: 30, height: 30)
                Text("Decide si eres cliente o profesional")
                    .font(.caption)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
    }
    
}

struct RolesContentView_Previews: PreviewProvider {
    static var previews: some View {
        RolesContentView(
            viewModel: DependencyInjectionContainer.shared.resolve(
                RolesViewModel.self,
                argument1: "3232332323"
            )!
        )
    }
}
