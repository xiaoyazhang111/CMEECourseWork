import scipy as sc
import scipy.stats
import scipy.integrate as integrate
import matplotlib.pylab as p


# a = sc.array(range(5)) # a one-dimensional array
# a = sc.array(range(5), float)
# a.dtype 
# # print(a.dtype)
# x = sc.arange(5)
# m = sc.arange(5.) #directly specify float using decimal
# # print(m)
# # print(x.shape)

# b = sc.array([i for i in range(10) if i % 2 ==1])
# # print(b)
# # # v = sc.array(range(6),float)
# # # v = sc.arange(8.)
# # # print(v)
# # # c = b.tolist()
# # # print(c)
# # print(b.shape)

# mat = sc.array([[1,2,6],[3,4,0]])

# mit = sc.array([[[1], [6]],[[2],[6]]])
# print(mit.shape)
# # print(mat)
# print(mat.shape)

# iu = sc.array([[1,3]])

# print(iu.shape)

# m = sc.array([1, 3, 5, 7, 9])
# n = m.tolist()
# print(m)
# print(m.shape)
# print(n)

# a = [1,2,3,4]
# b = sc.array(a)

# print(b)

mat = sc.array([[0, 1], [2, 3]])
# print(mat)
# print(mat[:,1])
# print(mat[0,0])
# print(mat[1,0])
# print(mat[:,0])
# print(mat[0,-1])
# mat[0,0] = -1 
# # mat[:,0] = [12,12]
# newRow = [[12,12]]
# mat = sc.append(mat, newRow, axis = 0)
# # print(mat)

# # mat = sc.array([[0, 1], [2, 3]])
# # mat0 = sc.array([[0, 10], [-1, 3]])
# # matt = sc.concatenate((mat, mat0), axis = 0)
# # print(matt)
# # mat = mat.ravel()
# # print(mat)
# # mat = mat.reshape((4,1))
# # print(mat)
# # print(sc.ones((4,2))) #(4,2) are the (row,col) array dimensions

# # print(sc.zeros((3,1)))

# mm = sc.arange(16)
# mm = mm.reshape(4,4) 
# nn = mm.transpose()
# # print(mm)
# # print(nn)

# # print(mm//(mm+1).transpose())

# # a = scipy.stats.norm.rvs(size = 10)

# # b = scipy.stats.randint.rvs(0, 10, size =7) 
# # print(b)

def dCR_dt(pops, t=0):

     R = pops[0]
     C = pops[1]
     dRdt = r * R - a * R * C 
     dCdt = -z * C + e * a * R * C
    
     return sc.array([dRdt, dCdt])

r = 1.
a = 0.1 
z = 1.5
e = 0.75
t = sc.linspace(0, 15, 1000)

R0 = 10
C0 = 5 
RC0 = sc.array([R0, C0])
pops, infodict = integrate.odeint(dCR_dt, RC0, t, full_output=True)
type(infodict)
infodict.keys()
infodict['message']





f1 = p.figure()

p.plot(pops[:,0], pops[:,1], 'r-', label='Resource density') # Plot

p.grid()
p.legend(loc='best')
p.xlabel('Resource density')
p.ylabel('Resource density')
p.title('Consumer density')
p.show()# To display the figure
