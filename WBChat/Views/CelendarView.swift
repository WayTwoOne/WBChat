//
//  CelendarView.swift
//  WBMessenger
//
//  Created by Vladimir on 27.06.2024.
//

import SwiftUI

struct CelendarView: View {
    @EnvironmentObject private var viewModel: CelendarViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 15) {
            DatePicker("Select a date", selection: $viewModel.dateVM, displayedComponents: [.date])
                .padding(.horizontal, 10)
            Picker("Country", selection: $viewModel.selectedCountry) {
                ForEach(viewModel.allCases) { category in
                    Text(category.flags).tag(category)
                }
            }
            
            List(viewModel.days, id: \.self) { day in
                Text(day)
                    .font(.system(size: 20))
                    .bold(viewModel.days[2] == day)
            }
            
            Spacer()
            Picker("Date format", selection: $viewModel.selectedDateFormat) {
                ForEach(viewModel.allCasesDate) { category in
                    Text(category.rawValue).tag(category)
                }
            }
            
            .onChange(of: viewModel.selectedCountry) { newValue in
                viewModel.dateTransformation(viewModel.dateVM, newValue, viewModel.selectedDateFormat)
            }
            .onChange(of: viewModel.dateVM) { newValue in
                viewModel.dateTransformation(newValue, viewModel.selectedCountry, viewModel.selectedDateFormat)
            }
            .onChange(of: viewModel.selectedDateFormat) { newValue in
                viewModel.dateTransformation(viewModel.dateVM, viewModel.selectedCountry, newValue)
            }
        }
        .pickerStyle(.segmented)
    }
}

struct CelendarView_Previews: PreviewProvider {
    static var previews: some View {
        CelendarView()
    }
}
