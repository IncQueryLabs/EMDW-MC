#ifndef __XUMLRT__COLLECTIONS__SET__BASIC_SET_HH
#define __XUMLRT__COLLECTIONS__SET__BASIC_SET_HH


#include <set>

namespace xumlrt {
namespace collections {
namespace set {
namespace basic_set {

template <class E>
inline bool isEmpty(const std::set<E>& collection);

template <class E>
inline unsigned size(const std::set<E>& collection);

template <class ContainedElement, class ActualElement>
inline bool add(std::set<ContainedElement>& collection, ActualElement element);

template <class E, class Collection>
inline bool addAll(std::set<E>& collection, Collection elements);

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

template <class ContainedElement, class ActualElement>
bool xumlrt::collections::set::basic_set::add(std::set<ContainedElement>& collection, ActualElement element) {
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