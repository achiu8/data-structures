ArrayList#new(size)
. Best-case complexity: O(1)
. Worst-case complexity: O(1)
. Initialization of the underlying fixed array will take the same amount of time
regardless of the number of elements in the array list because the individual
elements of the array are not declared.

ArrayList#add(element)
. Best-case complexity: O(1)
. Worst-case complexity: O(n)
. Adding an element to the end of the list will take constant time if the
underlying array is not yet full. In the worst case, the size of the underlying
array needs to be increased, with all existing elements getting copied over. The
process of copying over the existing elements will take O(n) time.

ArrayList#get(index)
. Best-case complexity: O(1)
. Worst-case complexity: O(1)
. Getting a given element in the array list will take constant time because
random access of an element in the underlying fixed array also takes constant
time.

ArrayList#set(index, element)
. Best-case complexity: O(1)
. Worst-case complexity: O(1)
. Setting a given element int he array list will take constant time because it
is just replacing the existing element at the index. Accessing / replacing an
existing element takes constant time, as with #get.

ArrayList#size
. Best-case complexity: O(1)
. Worst-case complexity: O(1)
. Getting the size of the array list takes constant time as long as the value is
stored and updated with each element addition.

ArrayList#insert(index, element)
. Best-case complexity: O(1)
. Worst-case complexity: O(n)
. In the best case, insertion of an element takes constant time if done so at
the last index of the current list. In the worst case, when the element in
inserted at the very beginning of the list, every subsequent element will have
to be shifted down as well, taking O(n) time.

