'''
Created on 09.12.2015

@author: Kati
'''

'''
Class of Parser 
'''
class Parser:
    
    '''
    this is the main function that call recursivly all functions in this class
    in order to verify if the input is a valid expression or not
    @param: string
    '''
    def parse(self, string):
        if self._proveValidity(string) is False:
            print("The expression '" + self._s + "' is: " +str(self._proveValidity(string)))
        else:        
            print("The expression '" + self._s + "' is: " + str(self._expression()))
        
    '''
    Returns if the whole expression is true or false
    @return: res
    '''
    def _expression(self):
        if self._s.count("+") == 0 | self._s.count("-") == 0:
            res = self._term()
        elif self._s.count("+") > 0 or self._s.count("-") > 0:
            res = self._term()
            while len(self._s) > 0 and self._s[0] == "+" or len(self._s) > 0 and self._s[0] == "-":
                self._s = self._s[1:]
        return res
        
    '''
    Returns if there is a valid term with true or false
    @return: res 
    '''
    def _term(self):
        if self._s.count("*") == 0 | self._s.count("/") == 0:
            res = self._factor()
        elif self._s.count("*") > 0 or self._s.count("/") > 0:
            res = self._factor()
            while len(self._s) > 0 and self._s[0] == "*"  or len(self._s) > 0 and self._s[0] == "/":
                self._s = self._s[1:]
        return res
        
    '''
    Returns if there is a valid factor and if it is a constant or a variable 
    also it checks if the amount and order of brackets is true or false.
    @return: res
    '''
    def _factor(self):
        if self._s[0] != "(":
            if self._s[0] is "0" or self._s[0] is "1" or self._s[0] is "2" or self._s[0] is "3" or self._s[0] is "4" or self._s[0] is "5" or self._s[0] is "6" or self._s[0] is "7" or self._s[0] is "8" or self._s[0] is "9":
                res = self._constant()
            elif self._s[0] is "x" or self._s[0] is "y" or self._s[0] is "z":
                res = self._variable() 
        elif self._s[0] == "(":
            self._s = self._s[1:]
            res = self._expression()
            if self._s[0] == ")":
                self._s = self._s[1:]
        return res
    
    '''
    this method proves if there is a valid variable 
    @return: res
    '''
    def _variable(self):
        res=False
        if self._s[0] is "x" or self._s[0] is "y" or self._s[0] is "z":
            res= True
            self._s = self._s[1:]
        return res
        
    '''
    this method proves if an digit exists
    @return: res
    '''
    def _constant(self):
        res = False
        if self._isDigit():
            while len(self._s) > 0 and self._isDigit():
                res= True
                self._s = self._s[1:]
        return res
        
    '''
    verifies the string if its a digit and returns true or false.
    @return: boolean
    '''
    def _isDigit(self):
        return str(self._s[0]).isdigit()
    
    '''
    verifies the right order of brackets and returns with true or false
    @return: integer
    '''
    def _bracketsOrder(self):
        brackets = 0
        for char in self._s:
            if brackets >= 0:
                if char == "(":
                    brackets += 1
                if char == ")":
                    brackets -= 1
        return brackets >= 0
        
    '''
    verifies if there exists empty brackets 
    @return: res
    '''
    def _emptyBrackets(self):
        res = False
        for i in range(len(self._s)):
            if self._s[i] != None and str(self._s[i]) == "(" and str(self._s[i + 1]) == ")":
                res = True
        return res
    

    '''
    verifies the entered elements if they are valid
    @return: res
    '''
    def _invalidElement(self):
        res = False
        for char in self._s:
            if not (self._isElementAllowed(char) or char == "(" or char == ")" or char == "+" or char == "-" or char == "*" or char == "/" or char == "x" or char == "y" or char == "z"):
                res = True
        return res
    
    '''
    verifies if the element is allowed in the parser
    @return: res
    '''
    def _isElementAllowed(self, input):
        res = False
        if input is "x" or input is "y" or input is "z" or input is "0" or input is "1" or input is "2" or input is "3" or input is "4" or input is "5" or input is "6" or input is "7" or input is "8" or input is "9":
            res = True
        else:
            res = False
        return res
    
    '''
    verifies if there is a valid element at the beginning of the expression
    @return: boolean value
    '''
    def _elementAtBeginning(self):
        return self._isElementAllowed(self._s[0])
    
    '''
    verifies if there is a valid element at the ending of the expression
    @return: boolean value 
    '''
    def _elementAtEnd(self):
        return self._isElementAllowed(self._s[len(self._s) - 1])
    
    '''
    checks if a digit or a variable is before an operator like + , - , * and / 
    @return: res
    '''
    def _isCharOperator(self):
        res = False
        for i in range(len(self._s) - 1):
            if i > 0 and ((str(self._s[i]) == "+" or str(self._s[i]) == "-" or str(self._s[i]) == "*" or str(self._s[i]) == "/") and (not (str(self._s[i + 1]) == "(" or self._isElementAllowed(self._s[i + 1]) ) or not (str(self._s[i - 1]) == ")" or self._isElementAllowed(self._s[i - 1]) ))):
                res = True
        return res
    
    '''
    checks if a operator or a digit or a variable is before an bracket or after it ( )
    @return: res
    '''
    def _isCharBracket(self):
        res = False
        for i in range(len(self._s) - 1):
            if i > 0 and ((str(self._s[i]) == "(" and self._isElementAllowed(self._s[i - 1]) ) or (str(self._s[i]) == ")" and self._isElementAllowed(self._s[i + 1]))):
                res = True
        return res
    
    '''
    catches all exceptions
    @return: res
    '''
    def _proveValidity(self, string):
        res = True
        string = str(string).replace(" ", "")
        self._s = string
        if len(self._s) == 0:
            res = False
        elif self._s.count("(") > 0 and not self._bracketsOrder():
            res = False        
        elif not (self._s.count("(") == self._s.count(")")):
            res = False
        elif self._emptyBrackets():
            res = False
        elif not self._elementAtBeginning() and not str(self._s[0]) == "(":
            res = False
        elif not self._elementAtEnd() and not str(self._s[len(self._s)-1]) == ")":
            res = False
        elif self._invalidElement():
            res = False
        elif self._isCharOperator():
            res = False
        elif self._isCharBracket():
            res = False
        return res
    