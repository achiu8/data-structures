LinkedList#new
. Best-case complexity: O(1)
. Worst-case complexity: O(1)
. A LinkedList always initializes with the same default values (nil head and
tail, 0 size).

LinkedList#insert_first(element)
. Best-case complexity: O(1)
. Worst-case complexity: O(1)
. Inserting a node at the front of a linked list only requires its head to be
changed. The rest of the nodes in the list will still maintain their values and
next pointers.

LinkedList#remove_first
. Best-case complexity: O(1)
. Worst-case complexity: O(1)
. Removing a node at the front of a linked list only requires its head to be
changed. The rest of the nodes in the list will still maintain their values and
next pointers.

LinkedList#insert_last(element)
. Best-case complexity: O(1)
. Worst-case complexity: O(n)
. If the tail of a list is known and stored, inserting a node at the back of a
list takes constant time, with only the next pointer of the existing tail
needing to be changed. If the tail of a list is not known or stored, inserting a
node at the back of a list takes O(n) time, since the entire list must be
traversed in order to know where it ends.

LinkedList#remove_last
. Best-case complexity: O(n)
. Worst-case complexity: O(n)
. Removing the last node of a list takes O(n) time because it requires the next
pointer of the second-last node to be set to nil. To get to the second-last
node, the entire list must be traversed until a node is reached whose next
pointer points to the tail.

LinkedList#get(index)
. Best-case complexity: O(n)
. Worst-case complexity: O(n)
. Since elements of a linked list cannot be indexed into, retrieving an element
at a particular "index" requires that all of the elements prior to that index be
traversed.

LinkedList#set(index, element)
. Best-case complexity: O(n)
. Worst-case complexity: O(n)
. Since elements of a linked list cannot be indexed into, setting an element at
a particular "index" requires that all of the elements prior to that index be
traversed.

LinkedList#size
. Best-case complexity: O(1)
. Worst-case complexity: O(n)
. If stored and updated with each insertion / removal, the size of a linked list
can be returned in constant time. If not stored, returning the size of a linked
list requires that the entire list be traversed and takes O(n) time.

Why is inserting a value in the middle of the collection faster with a
LinkedList than it is with an Array?
. Inserting a value in the middle of a linked list takes at worst O(n) time,
which is just the time it takes to traverse to that position. Otherwise, it just
involves changing the next pointer of the previous node. However, inserting a
value in the middle of an array requires that all of the subsequent elements be
shifted (and copied over, in the case of a full fixed array).

Refactoring
. In order to be able to retrieve the size of the linked list in constant time,
it must store and constantly update the value with every insertion or removal.
. In order to be able to remove the last node in constant time, each node in the
linked list needs to store a "prev" pointer in addition to a "next" pointer.
This is because, after the tail is removed, the new tail must have a next
pointer of nil. Without a "prev" pointer coming from the old tail node, the only
way to get to the new tail, or the second-to-last node, would be to iterate
through the entire list starting from the head. The downside to having a "prev"
pointer is the need to make sure that that additional pointer gets updated with
every insertion / removal performed on the list.
