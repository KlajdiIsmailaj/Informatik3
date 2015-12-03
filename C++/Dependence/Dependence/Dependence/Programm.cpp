#include <iostream>
#include <string>
#include <fstream>
#include <vector>
#include <thread>
#include <mutex>
#include <chrono>

	using namespace std;

	mutex key;

	vector<string> emails;        // list

								  // function for counting the emails with ".edu" ending 
	void eduCounter()
	{
		int j = 0;
		for (int i = 0; i < emails.size(); i++)
		{
			key.lock();
			if (emails[i].substr(emails[i].size() - 4, 4) == ".edu") {
				j++;
			}
			key.unlock();
		}
		cout << j << endl;
	}

	// function for reading in the textfile 1 
	void readMailsIn1()
	{
		string line;
		ifstream file("mails1.txt");
		//opens the text file
		if (file.is_open())
		{
			//reads line per line
			while (getline(file, line))
			{
				key.lock();
				emails.push_back(line);
				key.unlock();

			}
			file.close();

		}
		else
		{
			cout << "file is not open" << '\n';
		}
	}

	// function for reading in the textfile 2 
	void readMailsIn2()
	{
		string line;
		ifstream file("mails2.txt");
		//opens the text file
		if (file.is_open())
		{
			//reads line per line
			while (getline(file, line))
			{
				key.lock();
				emails.push_back(line);
				key.unlock();

			}
			file.close();

		}
		else
		{
			cout << "file is not open" << '\n';
		}
	}

	//main 
	int main()
	{
		//create first Thread and starts
		thread mailThread1(readMailsIn1);
		mailThread1.join();

		//create second Thread and starts
		thread mailThread2(readMailsIn2);
		mailThread2.join();

		//create third Thread and starts
		thread counterThread(eduCounter);
		counterThread.join();

		system("pause");
		return 0;
	}