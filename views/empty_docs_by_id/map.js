function(doc) {
  // 12 hours is the offset (found via guess & check) 60 mins, 60 secs
  emit(doc.id, [(doc.timestamp-(12*60*60))*1000,parseFloat(doc.emptyDocks)]);
}
