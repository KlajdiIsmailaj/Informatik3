#include "Producer.h"
#include <random>
#include <ctime>



int Producer::produce(){
	srand(time(NULL));
	int random = rand() % 100 + 1;
	//cout << random << endl;
	//buffer[0] = 0;
	return random;
}



