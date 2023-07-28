//
//  RegisterClientView.swift
//  Presentation
//
//  Created by CRISTIAN ANAYA on 27/07/23.
//

import SwiftUI

struct RegisterClientView: View {
    
    var body: some View {
        VStack {
            Text("Register client")
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton(label: "Registro"))
    }

}

struct RegisterClientView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterClientView()
    }
}
