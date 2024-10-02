import SwiftUI

struct EventRow: View {
    var event: Event
    @State private var currentDate = Date()
    @State private var timeRemaining: String = ""
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let formatter = RelativeDateTimeFormatter()

    var body: some View {
        VStack(alignment: .leading) {
            Text(event.title)
                .font(.largeTitle)
                .foregroundColor(event.textColor)
            
            // Dynamically calculate and display the relative date string
            Text(timeRemaining)
                .font(.subheadline)
        }
        .onAppear(perform: updateTimeRemaining)
        .onReceive(timer) { _ in
            currentDate = Date() // Update currentDate with the actual current time
            updateTimeRemaining()
        }
    }

    private func updateTimeRemaining() {
        timeRemaining = formatter.localizedString(for: event.date, relativeTo: Date.now)
    }
}

