//
//  LoginViewContent.swift
//  Presentation
//
//  Created by CRISTIAN ANAYA on 22/07/23.
//

import SwiftUI
import Combine
import Domain

struct LoginViewContent: View {
    
    @ObservedObject var viewModel: LoginViewModel
    @State var presentSheet = false
    @State var countryCode : String = "+57"
    @State var countryFlag : String = "🇨🇴"
    @State var countryPattern : String = "### ### ####"
    @State var countryLimit : Int = 17
    @State var mobPhoneNumber = ""
    @State private var searchCountry: String = ""
    @Environment(\.colorScheme) var colorScheme
    @FocusState private var keyIsFocused: Bool
    
    let counrties: [CPData] = Bundle.main.decode("CountryNumbers.json")
    
    var body: some View {
        GeometryReader { geo in
            let hasHomeIndicator = geo.safeAreaInsets.bottom > 0
            NavigationStack {
                VStack {
                    
                    Text("Ingresa tu número de telefono para continuar")
                        .font(FontManager.mediumHeadLine_2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, hasHomeIndicator ? 70 : 20)
                    
                    HStack {
                        Button {
                            presentSheet = true
                            keyIsFocused = false
                        } label: {
                            Text("\(countryFlag) \(viewModel.code)")
                                .font(FontManager.mediumTitle)
                                .padding(10)
                                .frame(minWidth: 80, minHeight: 47)
                                .background(backgroundColor, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                                .foregroundColor(foregroundColor)
                        }
                        
                        TextField("", text: $viewModel.phone)
                            .font(FontManager.mediumTitle)
                            .placeholder(when: viewModel.phone.isEmpty) {
                                Text("Tú numero")
                                    .font(FontManager.mediumTitle)
                                    .foregroundColor(.secondary)
                            }
                            .focused($keyIsFocused)
                            .keyboardType(.numbersAndPunctuation)
                            .onReceive(Just(mobPhoneNumber)) { _ in
                                applyPatternOnNumbers(&mobPhoneNumber, pattern: countryPattern, replacementCharacter: "#")
                            }
                            .padding(10)
                            .frame(minWidth: 80, minHeight: 47)
                            .background(backgroundColor, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                    }
                    .padding(.top, 20)
                    .padding(.bottom, 15)
                    
                    OTPComposableView()
                        .padding(.bottom, 15)
                    
                    Button {
                        if (viewModel.validationId.isEmpty) {
                            viewModel.sendOTPToPhoneNumber()
                        } else {
                            viewModel.verifyOTPAndLogin()
                        }
                    } label: {
                        Text(viewModel.validationId.isEmpty ? "Continuar" : "Verificar")
                            .font(FontManager.boldTitle)
                            .foregroundColor(.white)
                    }
                    .buttonStyle(OnboardingButtonStyle())
                }
                .animation(.easeInOut(duration: 0.6), value: keyIsFocused)
                .padding(.horizontal)
                
                Spacer()
                
            }
            .onTapGesture {
                hideKeyboard()
            }
            .sheet(isPresented: $presentSheet) {
                NavigationView {
                    List(filteredResorts) { country in
                        HStack {
                            Text(country.flag)
                            Text(country.name)
                                .font(.headline)
                            Spacer()
                            Text(country.dial_code)
                                .font(FontManager.mediumTitle)
                                .foregroundColor(.secondary)
                        }
                        .onTapGesture {
                            self.countryFlag = country.flag
                            viewModel.onCountryInput(code: country.dial_code)
                            self.countryCode = country.dial_code
                            self.countryPattern = country.pattern
                            self.countryLimit = country.limit
                            presentSheet = false
                            searchCountry = ""
                        }
                    }
                    .listStyle(.plain)
                    .searchable(text: $searchCountry, prompt: "Selecciona tu pais")
                }
                .presentationDetents([.medium, .large])
            }
            .presentationDetents([.medium, .large])
        }
        .ignoresSafeArea(.keyboard)
    }
    
    var filteredResorts: [CPData] {
        if searchCountry.isEmpty {
            return counrties
        } else {
            return counrties.filter { $0.name.contains(searchCountry) }
        }
    }
    
    var foregroundColor: Color {
        if colorScheme == .dark {
            return Color(.white)
        } else {
            return Color(.black)
        }
    }
    
    var backgroundColor: Color {
        if colorScheme == .dark {
            return Color(.systemGray5)
        } else {
            return Color(.systemGray6)
        }
    }
    
    func applyPatternOnNumbers(_ stringvar: inout String, pattern: String, replacementCharacter: Character) {
        var pureNumber = stringvar.replacingOccurrences( of: "[^0-9]", with: "", options: .regularExpression)
        for index in 0 ..< pattern.count {
            guard index < pureNumber.count else {
                stringvar = pureNumber
                return
            }
            let stringIndex = String.Index(utf16Offset: index, in: pattern)
            let patternCharacter = pattern[stringIndex]
            guard patternCharacter != replacementCharacter else { continue }
            pureNumber.insert(patternCharacter, at: stringIndex)
        }
        stringvar = pureNumber
    }
}


struct LoginViewContent_Previews: PreviewProvider {
    static var previews: some View {
        LoginViewContent(viewModel: LoginViewModel(
            getOTPUseCase: DependencyInjectionContainer.shared.resolve(GetOTPUseCase.self)!,
            loginUseCase: DependencyInjectionContainer.shared.resolve(LoginUseCase.self)!
        ), countryCode: "+1", countryFlag: "🇺🇸", countryPattern: "### ### ####", countryLimit: 17)
    }
}
