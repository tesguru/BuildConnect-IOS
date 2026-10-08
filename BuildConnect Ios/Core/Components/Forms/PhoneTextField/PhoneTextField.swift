import SwiftUI

// MARK: - Phone field

struct PhoneTextField: View {
    @Binding var country: Country
    @Binding var number: String
    

    @State private var showPicker = false

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {

            Text("Mobile Number")
                .font(.interMedium(16))
                .foregroundStyle(.black)

            HStack(spacing: 12) {

                // Flag + arrow: tap to open the country sheet
                Button {
                    showPicker = true
                } label: {
                    HStack(spacing: 8) {
                        Text(country.flag)
                            .font(.system(size: 24))
                        Image(systemName: "arrowtriangle.down.fill")
                            .font(.system(size: 10))
                            .foregroundStyle(.gray)
                    }
                }
                .buttonStyle(.plain)

                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 1, height: 28)

                Text(country.dialCode)
                    .font(.interMedium(18))
                    .foregroundStyle(.gray)

                TextField("Enter phone number", text: $number)
                    .keyboardType(.phonePad)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 18)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.white.opacity(0.6))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
            )
        }
        .sheet(isPresented: $showPicker) {
            CountryPickerSheet(selected: $country)
        }
    }
}

// MARK: - Country sheet

private struct CountryPickerSheet: View {
    @Binding var selected: Country
    @Environment(\.dismiss) private var dismiss
    @State private var search = ""

    private var results: [Country] {
        let all = PhoneService.shared.countries
        return search.isEmpty
            ? all
            : all.filter { $0.name.localizedCaseInsensitiveContains(search) }
    }

    var body: some View {
        VStack(spacing: 12) {
            TextField("Search country...", text: $search)
                .padding(16)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray.opacity(0.5))
                )

            ScrollView {
                LazyVStack(spacing: 8) {
                    ForEach(results) { country in
                        Button {
                            selected = country
                            dismiss()
                        } label: {
                            HStack(spacing: 16) {
                                Text(country.flag)
                                Text(country.dialCode)
                                    .foregroundStyle(.gray)
                                Text(country.name)
                                    .foregroundStyle(.black)
                                Spacer()
                            }
                            .padding(16)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.gray.opacity(0.1))
                            )
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
        }
        .padding(20)
    }
}

// MARK: - Preview

#Preview {
    struct Demo: View {
        @State private var country = PhoneService.shared.nigeria
        @State private var phone = ""
        var body: some View {
            PhoneTextField(country: $country, number: $phone)
                .padding()
        }
    }
    return Demo()
}
