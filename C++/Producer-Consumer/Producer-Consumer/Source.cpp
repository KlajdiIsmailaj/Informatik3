#include <iostream>
using namespace std;

int main() {
	//cout << capacity << endl;

	system("pause");
	return 0;
}

template<class G>
class Buffer {
public:
	int capacity;

public:
	void push(G element) {

	}

	//template<typename G> 
	G pop() {

	}

	bool isEmpty() {

	}

	bool isFull() {

	}

};

class Producer {
private:
	Buffer <int> buffer[5];

private:
	int produce() {

	}
};

class Consumer {
private:
	Buffer <int> buffer[5];

private:
	int consume(int element) {

	}
};