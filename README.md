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
```
