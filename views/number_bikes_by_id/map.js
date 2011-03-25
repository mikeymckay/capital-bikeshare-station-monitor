function(doc){
  emit(doc.id,[doc.timestamp,doc.nbBikes]);
}
