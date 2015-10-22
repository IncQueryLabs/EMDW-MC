#ifndef __XUMLRT__COLLECTIONS__SEQUENCE__BASIC_VECTOR_HH
#define __XUMLRT__COLLECTIONS__SEQUENCE__BASIC_VECTOR_HH


#include <vector>

namespace xumlrt {
namespace collections {
namespace sequence {
namespace basic_vector {

template <class E>
inline bool isEmpty(const std::vector<E>& collection);

template <class E>
inline unsigned size(const std::vector<E>& collection);

template <class ContainedElement, class ActualElement>
inline void add(std::vector<ContainedElement>& collection, ActualElement element);

template <class ContainedElement, class ActualElement>
inline void add(std::vector<ContainedElement>& collection, unsigned idx, ActualElement element);

template <class E>
inline E get(const std::vector<E>& collection, unsigned idx);

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

template <class ContainedElement, class ActualElement>
void xumlrt::collections::sequence::basic_vector::add(std::vector<ContainedElement>& collection, ActualElement element) {
	collection.push_back(element);
}

template <class ContainedElement, class ActualElement>
void xumlrt::collections::sequence::basic_vector::add(std::vector<ContainedElement>& collection, unsigned idx, ActualElement element) {
	auto it = collection.begin();
	std::advance(it, idx);
	collection.insert(it, element);
}

template <class E>
E xumlrt::collections::sequence::basic_vector::get(const std::vector<E>& collection, unsigned idx) {
	return collection[idx];
}

#endif // __XUMLRT__COLLECTIONS__SEQUENCE__BASIC_VECTOR_HH

