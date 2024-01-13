//
//  DashboardView.swift
//  Promova-TestTask
//
//  Created by Vladyslav Moroz on 12/01/2024.
//

import SwiftUI

struct DashboardView: View {
    // MARK: - View Model
    @StateObject var viewModel: DashboardViewModel

    // MARK: - Router
    @EnvironmentObject var router: Router

    var body: some View {
        VStack(spacing: .zero) {
            if viewModel.isLoading {
                PageLoadingView()
            } else {
                ContentSection
            }
        }
        .onAppear {
            Task {
                await viewModel.loadCategories()
            }
        }
    }

    var ContentSection: some View {
        ZStack {
            ScrollView {
                VStack(spacing: Theme.Dimensions.marginMediumVertical) {
                    ForEach(viewModel.categories, id: \.self) { item in
                        CategoryCardView(imageURL: item.imageURL, title: item.title, subTitle: item.description, type: item.type) {
                            item.type == .free ? router.push(to: .categoryDetails(item.title, item.content ?? [])) : viewModel.handleAlertAction(with: item.title, and: item.content ?? [], type: item.type)
                        }
                    }
                }
                .padding(.top, Theme.Dimensions.marginMediumVertical)
                .blur(radius: viewModel.shouldShowLoader ? 1 : 0)
            }
            if viewModel.shouldShowLoader {
                LoaderSection
            }
        }
        .background(Color(Theme.Colors.generalBgColor))
        .alert(isPresented: $viewModel.shouldShowAlert) {
            if viewModel.categoryCardType == .paid {
                Alert(
                    title: Text("Watch Ad to continue"),
                    primaryButton: .cancel(Text("Cancel")) {
                        viewModel.shouldShowAlert = false
                    },
                    secondaryButton: .default(Text("Show Ad")) {
                        viewModel.handleShowAdAction(with: router)
                    }
                )
            } else {
                Alert(title: Text("\(viewModel.categoryCardTitle) category coming soon"), dismissButton: .default(Text("OK")))
            }
        }
    }

    var LoaderSection: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: Theme.Constants.Dashboard.offsetWhenCollapseStarted)
                .foregroundColor(Color(Theme.Colors.lightBlue))
                .frame(width: Theme.Constants.Dashboard.circleSize.width, height: Theme.Constants.Dashboard.circleSize.height)
            Circle()
                .trim(from: .zero, to: viewModel.circleProgress)
                .stroke(style: StrokeStyle(lineWidth: Theme.Constants.Dashboard.offsetWhenCollapseStarted, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color(Theme.Colors.softBlue))
                .rotationEffect(Angle(degrees: Theme.Constants.Dashboard.circleRotationEffect))
                .frame(width: Theme.Constants.Dashboard.circleSize.width, height: Theme.Constants.Dashboard.circleSize.height)
        }
    }
}

#Preview {
    DashboardView(viewModel: DashboardViewModel())
}
