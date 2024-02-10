# SwiftUITodoApp
これは、SwiftDataを使用したTodoアプリです。

これを書くだけでモデルを定義できる。
```swift
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
```
