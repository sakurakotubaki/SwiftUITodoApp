import SwiftUI

struct AddTodoView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State var title: String = ""
    @State var note: String = ""
    @State var importance: Double = 1
    @State var date: Date = Date()
    
    var body: some View {
        // Form can write multiple parts when written inside NavigationStack
        
        NavigationStack{
//            Group Forms and DatePickers
            Form{
                TextField("Title", text: $title)
                DatePicker("Date", selection: $date, displayedComponents: .date)
                Text(String(repeating:"⭐️", count: Int(importance)))
                Slider(value: $importance, in: 1...5, step:1)
                TextEditor(text: $note)
            }
            // By adding toolbar to the navigationTitle, you can place Buttons on the screen.
            .navigationTitle("New Todo")
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Save") {
                        let newTodo = Todo(title: title, note: note, importance: importance, date: date
                        )
                        modelContext.insert(newTodo)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AddTodoView()
}
