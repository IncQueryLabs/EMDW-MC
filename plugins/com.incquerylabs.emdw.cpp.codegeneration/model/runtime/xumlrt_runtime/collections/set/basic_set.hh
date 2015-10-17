#ifndef __XUMLRT__COLLECTIONS__SET__BASIC_SET_HH
#define __XUMLRT__COLLECTIONS__SET__BASIC_SET_HH


#include <set>

namespace xumlrt {
namespace collections {
namespace set {
namespace basic_set {

template <class E>
bool isEmpty(const std::set<E>& collection);

template <class E>
unsigned size(const std::set<E>& collection);

template <class E>
bool add(std::set<E>& collection, E element);

template <class E, class Collection>
bool addAll(std::set<E>& collection, Collection elements);

}
}
}
}


template <class E>
bool xumlrt::collections::set::basic_set::isEmpty(const std::set<E>& collection) {
	return collection.empty();
}

template <class E>
unsigned xumlrt::collections::set::basic_set::size(const std::set<E> &collection) {
	return collection.size();
}

template <class E>
bool xumlrt::collections::set::basic_set::add(std::set<E>& collection, E element) {
	auto result = collection.insert(element);
	return result.second;
}

template <class E, class Collection>
bool xumlrt::collections::set::basic_set::addAll(std::set<E>& collection, Collection elements) {
	auto begin_size = collection.size();

	collection.insert(elements.begin(), elements.end());

	auto end_size = collection.size();
	return begin_size != end_size;
}

#endif // __XUMLRT__COLLECTIONS__SET__BASIC_SET_HH