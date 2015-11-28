//#include "Buffer.h"




//template <typename G>
//void Buffer<G>::push(G element) {
//	
//	unique_lock << mutex > l(lock);
//	not_full.wait(l, [this]() {return top != capacity; });// TO BE VERIFIED WITH TOP 
//	
//	top += 1;
//	values[top] = element;
//	not_empty.notify_one();
//}

//template <class G>
//G Buffer<G>::pop() {
//	unique_lock << mutex > l(lock);
//	not_empty.wait(l, [this]() {return top != 0; });
//	
//	G val = -1;
//	
//	if (!Buffer<G>::isEmpty()){
//		val = values[top];
//		top -= 1;
//	}else{
//		cerr << "buffer is empty !!!!!!";
//	}
//
//	not_full.notify_one();
//	return val;
//}

//template <class G>
//bool Buffer<G>::isEmpty() {
//	
//
//	if (top == -1){
//		return true;
//	}else{
//		return false;
//	}
//
//	
//}

//template <class G>
//bool Buffer<G>::isFull() {
//	
//	
//	if ((top + 1) == capacity) {
//		return true;
//	}else {
//		return false;
//	}
//}

//template <class G>
//Buffer<G>::Buffer( int capacity)
//{
//	top = -1;
//	this.capacity = capacity;
//	values = new G[capacity];
//}

//template <class G>
//Buffer<G>::~Buffer() 
//{
//	delete[]values;
//}