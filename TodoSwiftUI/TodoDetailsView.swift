import SwiftUI

struct TodoDetailsView: View {
    let detailTodo: Todo
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(detailTodo.title).bold()
                Text(detailTodo.date, style: .date).foregroundStyle(.secondary)
            }
            .padding(.bottom,1)
            HStack {
                Text(detailTodo.note)
                    .lineLimit(1)
                    .foregroundStyle(.secondary)
            }
            .padding(.bottom,1)
            HStack {
                Text(String(repeating:"⭐️", count: Int(detailTodo.importance)))
            }
        }
    }
}

#Preview {
    TodoDetailsView(detailTodo: Todo(title: "Grocery Shopping", note: "Need to buy vegetables and fruits", importance: 3, date: Date()))
}
