//
//  ServiceRow.swift
//  Services
//
//  Created by Vlad Boguzh on 31.03.2024.
//

import SwiftUI

struct ServiceRow: View {

    let service: Service

    var body: some View {
        HStack {
            image
            VStack {
                title
                subtitle
            }
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
    }

    private var image: some View {
        AsyncImage(url: service.iconUrl) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else if phase.error != nil {
                Image(systemName: "questionmark.diamond")
                    .imageScale(.large)
            } else {
                ProgressView()
            }
        }
        .frame(width: 60, height: 60)
    }

    private var title: some View {
        HStack {
            Text(service.name)
                .font(.system(size: 20))
            Spacer()
        }
    }

    private var subtitle: some View {
        HStack {
            Text(service.description)
                .font(.system(size: 14))
            Spacer()
        }
    }
}

#Preview {
    ServiceRow(service: Service.previewSample)
}
