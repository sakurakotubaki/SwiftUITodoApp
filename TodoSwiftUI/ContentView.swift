import SwiftUI
import SwiftData

@Model
final class Todo {
    var title: String
    var note: String
    var importance: Double = 1
    var date: Date = Date()
    
    init(title: String, note: String, importance: Double, date: Date) {
        self.title = title
        self.note = note
        self.importance = importance
        self.date = date
    }
}

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort:\Todo.date, order: .reverse) private var todos: [Todo]
    
    @State var showAddTodoView = false
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(todos, id: \.date) {(todo) in
                    NavigationLink(destination: EditTodoView(editingTodo: todo)){
                        VStack(alignment: .leading) {
                            HStack {
                                Text(todo.title).bold()
                                Text(todo.date, style: .date).foregroundStyle(.secondary)
                            }
                            .padding(.bottom,1)
                            HStack {
                                Text(todo.note)
                                    .lineLimit(1)
                                    .foregroundStyle(.secondary)
                            }
                            .padding(.bottom,1)
                            HStack {
                                Text(String(repeating:"⭐️", count: Int(todo.importance)))
                            }
                        }
                    }
                }
            }
            .navigationTitle("\(todos.count) Todo Items")
            .toolbar{
                ToolbarItem{
                    Button(action:{
                        showAddTodoView = true
                    }){
                        Label("Add Todo", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddTodoView, content: {
                AddTodoView()
            })
        }
    }
}

#Preview {
    ContentView()
}
