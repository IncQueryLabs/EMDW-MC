#ifndef __XUMLRT__COLLECTIONS__LIST__BASIC_LIST_HH
#define __XUMLRT__COLLECTIONS__LIST__BASIC_LIST_HH


#include <list>

namespace xumlrt {
namespace collections {
namespace list {
namespace basic_list {

template <class E>
inline bool isEmpty(const std::list<E>& collection);

template <class E>
inline unsigned size(const std::list<E>& collection);

template <class ContainedElement, class ActualElement>
inline void add(std::list<ContainedElement>& collection, ActualElement element);

template <class ContainedElement, class ActualElement>
inline void add(std::list<ContainedElement>& collection, unsigned idx, ActualElement element);

template <class ContainedElement, class ActualElement>
inline void remove(std::list<ContainedElement>& collection, ActualElement element);

template <class E>
inline E get(const std::list<E>& collection, unsigned idx);

}
}
}
}

template <class E>
bool xumlrt::collections::list::basic_list::isEmpty(const std::list<E>& collection) {
	return collection.empty();
}

template <class E>
unsigned xumlrt::collections::list::basic_list::size(const std::list<E>& collection) {
	return collection.size();
}

template <class ContainedElement, class ActualElement>
void xumlrt::collections::list::basic_list::add(std::list<ContainedElement>& collection, ActualElement element) {
	collection.push_back(element);
}

template <class ContainedElement, class ActualElement>
void xumlrt::collections::list::basic_list::add(std::list<ContainedElement>& collection, unsigned idx, ActualElement element) {
	auto it = collection.begin();
	std::advance(it, idx);
	collection.insert(it, element);
}

template <class ContainedElement, class ActualElement>
void xumlrt::collections::list::basic_list::remove(std::list<ContainedElement>& collection, ActualElement element) {
	collection.remove(element);
}

template <class E>
E xumlrt::collections::list::basic_list::get(const std::list<E>& collection, unsigned idx) {
	return collection[idx];
}

#endif /* __XUMLRT__COLLECTIONS__LIST__BASIC_LIST_HH */
