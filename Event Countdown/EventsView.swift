import SwiftUI

struct Event: Identifiable, Comparable, Hashable {
    var id = UUID()
    var title: String
    var date: Date
    var textColor: Color
    
    static func < (lhs: Event, rhs: Event) -> Bool {
        lhs.date < rhs.date
    }
}

struct EventsView: View {
    @State private var events: [Event] = []
    @State private var selectedMode: Mode? = nil

    enum Mode: Hashable {
        case add
        case edit(Event)
    }

    var body: some View {
        NavigationStack {
            List {
                ForEach(events.sorted()) { event in
                    Button(action: {
                        selectedMode = .edit(event)
                    }) {
                        EventRow(event: event)
                    }
                }
                .onDelete(perform: deleteEvent)
            }
            .navigationTitle("Events")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        selectedMode = .add
                    }) {
                        Label("Add", systemImage: "plus")
                    }
                }
            }
            .navigationDestination(isPresented: Binding(
                get: { selectedMode != nil },
                set: { if !$0 { selectedMode = nil } }
            )) {
                if let mode = selectedMode {
                    switch mode {
                    case .add:
                        EventForm(mode: .add, event: Event(title: "", date: Date(), textColor: .black)) { newEvent in
                            events.append(newEvent)
                            selectedMode = nil
                        }
                    case .edit(let event):
                        EventForm(mode: .edit(event), event: event) { updatedEvent in
                            if let index = events.firstIndex(where: { $0.id == event.id }) {
                                events[index] = updatedEvent
                            }
                            selectedMode = nil
                        }
                    }
                }
            }
        }
    }

    private func deleteEvent(at offsets: IndexSet) {
        events.remove(atOffsets: offsets)
    }
}
