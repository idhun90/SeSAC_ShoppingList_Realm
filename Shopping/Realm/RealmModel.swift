import Foundation

import RealmSwift

class UserShoppinglist: Object {
    @Persisted var list: String
    @Persisted var created = Date()
    @Persisted var favorite: Bool
    @Persisted var todo: Bool
    
    //PK
    @Persisted(primaryKey: true) var objectId: ObjectId
    
    convenience init(list: String, created: Date) {
        self.init()
        self.list = list
        self.created = created
        self.favorite = false
        self.todo = false
    }
}
