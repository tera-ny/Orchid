# Orchid

It is property wrapper with firestore.

❗️ this package use firebase ios sdk 8.0.0 branch ❗️

## installation

```Package.swift
.package(name: "Orchid", url: "https://github.com/tera-ny/Orchid.git", from "0.0.1")
```

## usage

```main.swift
import Orchid
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Room {
  @DocumentID var id: String?
  let name: string
  let friends: [string]
  let isActive: bool
}

struct ContentView: View {
  @Orchid var rooms: [Room]
  init(query: Query) {
    _room = .init(query: query)
  }
  var body: some View {
    ScrollView {
      if ($rooms) {
          Text("読み込みに失敗しました")
      } else {
        LazyVStack {
          ForEach(0..<rooms.count) { index in
            Text(rooms[index].name)
          }
        }
      }
    }
  }
}
```
