//
//  CategoryDetailsView.swift
//  Promova-TestTask
//
//  Created by Vladyslav Moroz on 13/01/2024.
//

import SwiftUI

struct CategoryDetailsView: View {
    // MARK: - Router
    @EnvironmentObject var router: Router

    var body: some View {
        Button {
            router.pop()
        } label: {
            Text("BACK")
        }
        .background(Color(Theme.Colors.generalBgColor))
    }

}

#Preview {
    CategoryDetailsView()
}
