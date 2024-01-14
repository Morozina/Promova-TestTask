//
//  PageLoadingView.swift
//  Promova-TestTask
//
//  Created by Vladyslav Moroz on 13/01/2024.
//

import SwiftUI

struct PageLoadingView: View {
    @State var selectedElement: Int = 1

    var body: some View {
        HStack(spacing: Theme.Dimensions.defaultLayoutMargin) {
            Circle()
                .fill(Color(Theme.Colors.softBlue))
                .frame(width: selectedElement == 1 ? Theme.Constants.largeIconSize.width : Theme.Constants.mediumIconSize.width)
            Circle()
                .fill(Color(Theme.Colors.softBlue))
                .frame(width: selectedElement == 2 ? Theme.Constants.largeIconSize.width : Theme.Constants.mediumIconSize.width)
            Circle()
                .fill(Color(Theme.Colors.softBlue))
                .frame(width: selectedElement == 3 ? Theme.Constants.largeIconSize.width : Theme.Constants.mediumIconSize.width)
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: Theme.Constants.loadingAnimationTimeInterval, repeats: true) { _ in
                withAnimation {
                    if selectedElement <= 3 {
                        selectedElement = selectedElement.increment()
                    } else {
                        selectedElement = 1
                    }
                }
            }
        }
    }
}

#Preview {
    PageLoadingView()
}
