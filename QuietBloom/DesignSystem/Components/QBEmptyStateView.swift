import SwiftUI

struct QBEmptyStateView: View {
    let systemImage: String
    let title: String
    let message: String

    var body: some View {
        VStack(spacing: QBSpacing.medium) {
            Image(systemName: systemImage)
                .font(.system(size: 34, weight: .regular))
                .foregroundStyle(QBColors.sage)
                .accessibilityHidden(true)

            VStack(spacing: QBSpacing.xSmall) {
                Text(title)
                    .font(QBTypography.sectionTitle)
                    .foregroundStyle(QBColors.textPrimary)
                    .multilineTextAlignment(.center)

                Text(message)
                    .font(QBTypography.quiet)
                    .foregroundStyle(QBColors.textSecondary)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(QBSpacing.large)
        .background(QBColors.elevatedBackground, in: RoundedRectangle(cornerRadius: 8, style: .continuous))
    }
}

#Preview {
    QBEmptyStateView(
        systemImage: "heart",
        title: "A quiet place to begin",
        message: "Your first reflection can be small. One honest sentence is enough."
    )
    .padding()
    .background(QBColors.background)
}
