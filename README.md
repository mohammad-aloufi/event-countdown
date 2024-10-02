# Event Countdown App

A simple SwiftUI app to manage events, allowing users to add, edit, and delete events. This project utilizes the new `NavigationStack` and `navigationDestination` APIs in SwiftUI to handle navigation between views for adding and editing events.

## Features

- **Add Event**: Users can add a new event with a title, date, and text color.
- **Edit Event**: Users can edit existing events by navigating to a detailed form.
- **Delete Event**: Events can be deleted via swipe actions in the event list.
- **List of Events**: The events are sorted by date and displayed in a list.

## Project Structure

```text
.
├── Event.swift            # The Event model, conforming to Identifiable, Comparable, and Hashable
├── AddEditEvents.swift    # The form used to add or edit events
├── EventRow.swift         # A view to display individual event rows in the list
└── EventsView.swift       # The main view that displays the list of events and handles navigation
```

## Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/mohammad-aloufi/event-countdown.git
   ```

2. Open the project in Xcode:
   ```bash
   open EventsManagerApp.xcodeproj
   ```

3. Run the project:
   - Select the desired simulator or device.
   - Press Cmd + R or use the Run button in Xcode to build and run the app.
```