#ifndef __XUMLRT__COLLECTIONS__BAG__BASIC_MULTISET_HH
#define __XUMLRT__COLLECTIONS__BAG__BASIC_MULTISET_HH


#include <set>

namespace xumlrt {
namespace collections {
namespace multiset {
namespace basic_multiset {

template <class E>
inline bool isEmpty(const std::multiset<E>& collection);

template <class E>
inline unsigned size(const std::multiset<E>& collection);

template <class ContainedElement, class ActualElement>
inline void add(std::multiset<ContainedElement>& collection, ActualElement element);

template <class E, class Collection>
inline bool addAll(std::multiset<E>& collection, Collection elements);

}
}
}
}


template <class E>
bool xumlrt::collections::multiset::basic_multiset::isEmpty(const std::multiset<E>& collection) {
	return collection.empty();
}

template <class E>
unsigned xumlrt::collections::multiset::basic_multiset::size(const std::multiset<E> &collection) {
	return collection.size();
}

template <class ContainedElement, class ActualElement>
void xumlrt::collections::multiset::basic_multiset::add(std::multiset<ContainedElement>& collection, ActualElement element) {
	collection.insert(element);
}

template <class E, class Collection>
bool xumlrt::collections::multiset::basic_multiset::addAll(std::multiset<E>& collection, Collection elements) {
	auto begin_size = collection.size();

	collection.insert(elements.begin(), elements.end());

	auto end_size = collection.size();
	return begin_size != end_size;
}

#endif // __XUMLRT__COLLECTIONS__BAG__BASIC_MULTISET_HH