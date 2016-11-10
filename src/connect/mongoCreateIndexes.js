/**
 * Created by Administrator on 11/10/2016.
 */
msServiceConfigCollection="msServerConfigModel"

var msConfigCursor = db.getCollection(msServiceConfigCollection).find()
var collectionToCreateIndexes = new Array();
var cursorPosition = 0;
while(msConfigCursor.hasNext()) {
    item = msConfigCursor.next();
    collectionToCreateIndexes[cursorPosition++] = item['name']
}
print(collectionToCreateIndexes)



for (var iter in collectionToCreateIndexes) {
    // printjson(db.getCollection(collectionName).getIndexes())
    db.getCollection(collectionToCreateIndexes[iter]).createIndex({"day":-1, "msName":1})
    db.getCollection(collectionToCreateIndexes[iter]).createIndex({"hour":-1, "msName":1})
    db.getCollection(collectionToCreateIndexes[iter]).createIndex({"patternUrl":1, "msName":1, "day":-1})
    db.getCollection(collectionToCreateIndexes[iter]).createIndex({"serviceType":1})
    db.getCollection(collectionToCreateIndexes[iter]).createIndex({"parameters.serviceType":1})
    db.getCollection(collectionToCreateIndexes[iter]).createIndex({"parameters.publicServiceType":1})
    // printjson(db.getCollection(collectionName).getIndexes())
}