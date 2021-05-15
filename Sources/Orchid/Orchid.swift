
import FirebaseFirestore
import FirebaseFirestoreSwift

@propertyWrapper
public class Orchid<Value: Codable> {
    private var listener: ListenerRegistration? = nil
    private var error: Error? = nil
    private var documents: [Value] = []
    deinit {
        listener?.remove()
    }
    public init(query: Query) {
        listener = query.addSnapshotListener { [weak self] snapshot, error in
            self?.error = error
            self?.documents = snapshot?.documents
                .compactMap {
                    do {
                        return try $0.data(as: Value.self)
                    } catch {
                        self?.error = error
                        assertionFailure("decode error")
                        return nil
                    }
                } ?? []
        }
    }
    public var wrappedValue: [Value] {
        documents
    }
    public var projectedValue: Error? {
        error
    }
}
