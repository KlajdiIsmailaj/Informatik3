'''
Created on 09.12.2015

@author: Kati
'''
from multiprocessing.dummy import Pool as ThreadPool
from Parser import Parser

list=[]

''' 
this method parses the lines of the txt document
'''
def func(string):
    p = Parser()
    p.parse(string)
'''
this method opens the document and reads line per line and saves each line in an array
'''   
def readFile():
    f = open("expressions.txt", "r")
    for line in f:
        list.append(line.strip())
    f.close()

''' 
this method is the main run method for threadpooling
'''     
def execute():
    readFile()
    pool=ThreadPool(3)       
    print(pool.map(func, list))
    pool.close()
    pool.join() 

'''
main
'''  
if __name__ == '__main__':
    execute()