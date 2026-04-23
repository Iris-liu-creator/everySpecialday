import SwiftUI

struct QBSectionCard<Content: View>: View {
    let title: String
    let subtitle: String?
    @ViewBuilder let content: Content

    init(title: String, subtitle: String? = nil, @ViewBuilder content: () -> Content) {
        self.title = title
        self.subtitle = subtitle
        self.content = content()
    }

    var body: some View {
        VStack(alignment: .leading, spacing: QBSpacing.medium) {
            VStack(alignment: .leading, spacing: QBSpacing.xSmall) {
                Text(title)
                    .font(QBTypography.sectionTitle)
                    .foregroundStyle(QBColors.textPrimary)

                if let subtitle {
                    Text(subtitle)
                        .font(QBTypography.quiet)
                        .foregroundStyle(QBColors.textSecondary)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }

            content
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(QBSpacing.medium)
        .background(QBColors.elevatedBackground, in: RoundedRectangle(cornerRadius: 8, style: .continuous))
    }
}

#Preview {
    QBSectionCard(title: "Today", subtitle: "A soft place for what matters.") {
        Text("Who made life feel lighter today?")
            .font(QBTypography.body)
    }
    .padding()
    .background(QBColors.background)
}
