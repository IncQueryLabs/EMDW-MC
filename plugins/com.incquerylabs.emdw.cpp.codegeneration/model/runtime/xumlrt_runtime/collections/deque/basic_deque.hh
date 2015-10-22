#ifndef __XUMLRT__COLLECTIONS__DEQUE__BASIC_DEQUE_HH
#define __XUMLRT__COLLECTIONS__DEQUE__BASIC_DEQUE_HH


#include <deque>

namespace xumlrt {
namespace collections {
namespace deque {
namespace basic_deque {

template <class E>
inline bool isEmpty(const std::deque<E>& collection);

template <class E>
inline unsigned size(const std::deque<E>& collection);

template <class ContainedElement, class ActualElement>
inline void add(std::deque<ContainedElement>& collection, ActualElement element);

template <class ContainedElement, class ActualElement>
inline void add(std::deque<ContainedElement>& collection, unsigned idx, ActualElement element);

template <class E>
inline E get(const std::deque<E>& collection, unsigned idx);

}
}
}
}

template <class E>
bool xumlrt::collections::deque::basic_deque::isEmpty(const std::deque<E>& collection) {
	return collection.empty();
}

template <class E>
unsigned xumlrt::collections::deque::basic_deque::size(const std::deque<E>& collection) {
	return collection.size();
}

template <class ContainedElement, class ActualElement>
void xumlrt::collections::deque::basic_deque::add(std::deque<ContainedElement>& collection, ActualElement element) {
	collection.push_back(element);
}

template <class ContainedElement, class ActualElement>
void xumlrt::collections::deque::basic_deque::add(std::deque<ContainedElement>& collection, unsigned idx, ActualElement element) {
	auto it = collection.begin();
	std::advance(it, idx);
	collection.insert(it, element);
}

template <class E>
E xumlrt::collections::deque::basic_deque::get(const std::deque<E>& collection, unsigned idx) {
	return collection[idx];
}

#endif /* __XUMLRT__COLLECTIONS__DEQUE__BASIC_DEQUE_HH */
