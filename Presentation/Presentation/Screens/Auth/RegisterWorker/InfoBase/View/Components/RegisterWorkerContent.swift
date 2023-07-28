//
//  RegisterWorkerContent.swift
//  Presentation
//
//  Created by CRISTIAN ANAYA on 27/07/23.
//

import SwiftUI
import Domain

struct RegisterWorkerContent: View {
    
    @ObservedObject var viewModel: RegisterWorkerViewModel


    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 30) {
                 
                 Text("Finalmente eres un miembro de nuestra familia. Todavia necesitamos algunos detalles mas para concerte mejor")
                     .font(FontManager.regularTitle)
                     .foregroundColor(.gray)
                 
                TextField("", text: $viewModel.state.name)
                    .font(FontManager.mediumTitle)
                    .padding(.leading, 8)
                    .placeholder(when: viewModel.state.name.isEmpty) {
                        Text("Nombre")
                            .font(FontManager.mediumTitle)
                            .foregroundColor(.secondary)
                            .padding(.leading, 8)
                    }
                    .frame(minWidth: 80, minHeight: 47)
                    .background(.white, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))

                TextField("", text: $viewModel.state.lastname)
                    .font(FontManager.mediumTitle)
                    .padding(.leading, 8)
                    .placeholder(when: viewModel.state.lastname.isEmpty) {
                        Text("Apellido")
                            .font(FontManager.mediumTitle)
                            .foregroundColor(.secondary)
                            .padding(.leading, 8)

                    }
                    .frame(minWidth: 80, minHeight: 47)
                    .background(.white, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))

                 
                TextField("", text: $viewModel.state.email)
                    .font(FontManager.mediumTitle)
                    .padding(.leading, 8)
                    .placeholder(when: viewModel.state.email.isEmpty) {
                        Text("Email")
                            .font(FontManager.mediumTitle)
                            .foregroundColor(.secondary)
                            .padding(.leading, 8)

                    }
                    .frame(minWidth: 80, minHeight: 47)
                    .background(.white, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))

                Text("**Solo se usará para cualquier tipo de duda o soporte que se presente durante el uso de la plataforma")
                    .font(FontManager.mediumTitle_15)
                    .foregroundColor(.gray)
                 
                 CustomDefaultButton(
                    text: "Guardar",
                    style: FontManager.boldTitle,
                    roundedCornerValue: 50) {
                        viewModel.register()
                    }
                 
                 // Add other views using viewModel.state as needed
             }
             .frame(maxWidth: .infinity, alignment: .leading) // Alinea el VStack a la izquierda
             .padding()
         }
    }

}

struct RegisterWorkerContent_Previews: PreviewProvider {
    static var previews: some View {
        RegisterWorkerContent(viewModel: RegisterWorkerViewModel(
            registerUseCase: DependencyInjectionContainer.shared.resolve(RegisterUseCase.self)!,
            phone: "3232323",
            role: "Client"
        ))
    }
}

