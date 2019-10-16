# What does each of fooXX do? 

import sys
def foo1(x):
    """x takes the value x*0.5"""
    return x ** 0.5

def foo2(x, y):
    """find the lager number between x and y"""
    if x > y:
        return x
    return y

def foo3(x, y, z):
    """put the largest number at end"""
    if x > y:
        tmp = y
        y = x
        x = tmp
    if y > z:
        tmp = z
        z = y
        y = tmp
    return [x, y, z]

def foo4(x):
    """multiple numbers from 1 to x"""
    result = 1
    for i in range(1, x + 1):
        result = result * i
    return result

def foo5(x): # a recursive function that calculates the factorial of x
    if x == 1:
        return 1
    return x * foo5(x - 1)
     
def foo6(x): # Calculate the factorial of x in a different way
    facto = 1
    while x >= 1:
        facto = facto * x
        x = x - 1
    return facto

def main(argv):
    print(foo1(1))
    print(foo2(2,3))
    print(foo3(5,4,8))
    print(foo4(90))
    print(foo5(6))
    print(foo6(8))
    return 0

if (__name__ == "__main__"):
    status = main(sys.argv)
    sys.exit(status)