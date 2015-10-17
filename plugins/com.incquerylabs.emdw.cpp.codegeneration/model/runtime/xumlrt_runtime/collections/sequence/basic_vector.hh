#ifndef __XUMLRT__COLLECTIONS__SEQUENCE__BASIC_VECTOR_HH
#define __XUMLRT__COLLECTIONS__SEQUENCE__BASIC_VECTOR_HH


#include <vector>

namespace xumlrt {
namespace collections {
namespace sequence {
namespace basic_vector {

template <class E>
bool isEmpty(const std::vector<E>& collection);

template <class E>
unsigned size(const std::vector<E>& collection);

template <class E>
void add(std::vector<E>& collection, E element);

template <class E>
void add(std::vector<E>& collection, unsigned idx, E element);

template <class E>
E get(std::vector<E>& collection, unsigned idx);

}
}
}
}


template <class E>
bool xumlrt::collections::sequence::basic_vector::isEmpty(const std::vector<E>& collection) {
	return collection.empty();
}

template <class E>
unsigned xumlrt::collections::sequence::basic_vector::size(const std::vector<E>& collection) {
	return collection.size();
}

template <class E>
void xumlrt::collections::sequence::basic_vector::add(std::vector<E>& collection, E element) {
	collection.push_back(element);
}

template <class E>
void xumlrt::collections::sequence::basic_vector::add(std::vector<E>& collection, unsigned idx, E element) {
	auto it = collection.begin();
	std::advance(it, idx);
	collection.insert(it, element);
}

template <class E>
E xumlrt::collections::sequence::basic_vector::get(std::vector<E>& collection, unsigned idx) {
	return collection[idx];
}

#endif // __XUMLRT__COLLECTIONS__SEQUENCE__BASIC_VECTOR_HH

