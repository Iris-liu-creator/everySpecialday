import Foundation

enum DateFormatting {
    static let shortDate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()

    static func monthName(_ month: Int) -> String {
        guard (1...12).contains(month) else { return "Month \(month)" }
        return Calendar.current.monthSymbols[month - 1]
    }
}
