import SwiftUI

extension Warp {
    /// A custom date picker that shows only month and year using `UIDatePicker`.
    public struct MonthYearPicker: UIViewRepresentable {
        @Binding var date: Date
        
        public init(date: Binding<Date>) {
            self._date = date
        }
        
        public func makeUIView(context: Context) -> UIDatePicker {
            let datePicker = UIDatePicker()
            if #available(iOS 17.4, *) {
                datePicker.datePickerMode = .yearAndMonth
            } else {
                datePicker.datePickerMode = .date
            }
            datePicker.preferredDatePickerStyle = .wheels
            datePicker.addTarget(
                context.coordinator,
                action: #selector(Coordinator.dateChanged(_:)),
                for: .valueChanged
            )
            
            // Configure date picker to start with the current month and year
            let calendar = Calendar.current
            var components = DateComponents()
            components.year = calendar.component(.year, from: Date())
            components.month = calendar.component(.month, from: Date())
            datePicker.calendar = calendar
            datePicker.setDate(calendar.date(from: components) ?? Date(), animated: false)
            
            return datePicker
        }
        
        public func updateUIView(_ uiView: UIDatePicker, context: Context) {
            uiView.date = date
        }
        
        public func makeCoordinator() -> Coordinator {
            Coordinator(self)
        }
        
        public class Coordinator: NSObject {
            var parent: MonthYearPicker
            
            init(_ parent: MonthYearPicker) {
                self.parent = parent
            }
            
            @objc func dateChanged(_ sender: UIDatePicker) {
                parent.date = sender.date
            }
        }
    }
}
