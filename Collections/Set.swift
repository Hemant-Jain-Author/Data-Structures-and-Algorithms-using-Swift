// Create a hash set.
var hs : Set<String> = Set<String>();

// Add elements to the hash set.
hs.insert("Banana");
hs.insert("Apple");
hs.insert("Mango");

print("Grapes present : " + String(hs.contains("Grapes")));
print("Apple present : " + String(hs.contains("Apple")));
print(hs);

hs.remove("Apple");
print("Apple present : " + String(hs.contains("Apple")));
print(hs);

/* 
Grapes present : false
Apple present : true
["Apple", "Mango", "Banana"]
Apple present : false
["Mango", "Banana"]
 */