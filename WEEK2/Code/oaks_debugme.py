import csv
import sys
import doctest 


def is_an_oak(name):

    """Find whether is_an_oak function works as expected.

    >>> is_an_oak('Fagus sylvatica')
    print('FOUND AN OAK!')
    """

    return name.lower().startswith('quercus')

# def main(argv): 
    # f = open('../data/TestOaksData.csv','r')
    # g = open('../data/JustOaksData.csv','w')
    # taxa = csv.reader(f)
    # csvwrite = csv.writer(g)
    # oaks = set()
    # for row in taxa:
    #     print(row)
    #     print ("The genus is: ") 
    #     print(row[0] + '\n')
    #     if is_an_oak(row[0]):
    #         print('FOUND AN OAK!\n')
    #         csvwrite.writerow([row[0], row[1]])    

    # return 0
doctest.testmod()
# if (__name__ == "__main__"):
#     status = main(sys.argv)