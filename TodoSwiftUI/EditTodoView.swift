import SwiftUI

struct EditTodoView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State var editingTodo: Todo
    @State var eidtMode = false
    
    var body: some View {
        if eidtMode {
            Form{
                TextField("Title", text: $editingTodo.title)
                DatePicker("Date", selection: $editingTodo.date, displayedComponents: .date)
                Text(String(repeating:"⭐️", count: Int(editingTodo.importance)))
                Slider(value: $editingTodo.importance, in: 1...5, step:1)
                TextEditor(text: $editingTodo.note)
                    .frame(minHeight: 200)
            }
            .navigationTitle("Edit Mode")
            .toolbar{
                Button("Delete") {
                    modelContext.delete(editingTodo)
                    dismiss()
                }
                .foregroundColor(.red)
                Button("Done") {
                    eidtMode = false
                }
            }
        } else {
            TodoDetailsView(detailTodo: editingTodo)
                .toolbar{
                    Button("Edit"){
                        eidtMode = true
                    }
                }
        }
    }
}

#Preview {
    EditTodoView(editingTodo: Todo(title: "sample task", note: "sample nopte", importance: 3, date: Date()))
}
