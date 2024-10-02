import SwiftUI

struct EventForm: View {
    @Environment(\.dismiss) var dismiss
    var event: Event
    var onSave: (Event) -> Void
    @State private var title: String
    @State private var date: Date
    @State private var textColor: Color
    var mode: Mode // Add this to store the mode

    enum Mode {
        case add
        case edit(Event)
    }
    
    private var navigationTitle: String {
        switch mode { // Use mode here
        case .add:
            return "Add Event"
        case .edit:
            return "Edit \(event.title)"
        }
    }
    
    // Modify the initializer to accept `mode` correctly
    init(mode: Mode, event: Event, onSave: @escaping (Event) -> Void) {
        self.mode = mode // Store the mode
        self.event = event
        self.onSave = onSave
        // Set initial values for @State properties
        _title = State(initialValue: event.title)
        _date = State(initialValue: event.date)
        _textColor = State(initialValue: event.textColor)
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Event information") {
                    TextField("Event title", text: $title)
                    DatePicker("Select date", selection: $date)
                    ColorPicker("Text Color", selection: $textColor)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        let newEvent = Event(id: event.id, title: title, date: date, textColor: textColor)
                        onSave(newEvent)
                        dismiss()
                    } label: {
                        Label("Save", systemImage: "square.and.arrow.down")
                    }
                    .disabled(title.isEmpty)
                }
            }
            .navigationTitle(navigationTitle)
        }
    }
}

