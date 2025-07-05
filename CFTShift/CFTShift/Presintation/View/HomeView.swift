//
//  HomeView.swift
//  CFTShift
//
//  Created by Виталий Багаутдинов on 02.07.2025.
//

import SwiftUI

struct HomeView: View {
    @StateObject var hvm = HomeViewModel()
    @ObservedObject var rvm: RegistrationViewModel
    
    // На симуляторе если сессия сохранена может быть баг - не появляются данные, нужно запустить на самом устройсте, тогда все работает корректно
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 16) {
                    if hvm.isLoading {
                        ProgressView()
                    } else {
                        List(hvm.data, id: \.self) { item in
                            ItemView(item: item)
                        }
                        .listStyle(.plain)
                    }
                    Spacer()
                    Button {
                        hvm.showPopUp()
                    } label: {
                        Text("Приветствие")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }.padding()
                if hvm.isView {
                    GreetingModalView(user: rvm.user ?? UserModel.empty(), isView: $hvm.isView)
                    
                }
            }
            .onAppear(perform: {
                rvm.getUser()
                hvm.getData()
            })
            .navigationTitle("Главный экран")
        }
    }
}

#Preview {
    HomeView(rvm: RegisterDI.make())
}
