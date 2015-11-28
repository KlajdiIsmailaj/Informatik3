#pragma once

template<class G>
class Buffer{

public:
	int capacity=5;

public:
	void push(G element);	// push element
	G pop();				// pop element 
	bool isEmpty();			// return true if empty.
	bool isFull();			// return true if full.

};

