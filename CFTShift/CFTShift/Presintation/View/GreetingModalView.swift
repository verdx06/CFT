import SwiftUI

struct GreetingModalView: View {
    let user: UserModel
    @Binding var isView: Bool
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.2).ignoresSafeArea()
            VStack(spacing: 20) {
                Text("Привет, \(user.name + " " + user.surname)!")
                    .font(.title2)
                    .padding()
                    .foregroundColor(Color.black)
                    .background(Color.white)
                    .cornerRadius(12)
            }
        }.onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    isView = false
            }
        }
    }
}
