import scipy as sc
import scipy.stats
import scipy.integrate as integrate
import matplotlib.pylab as p

def dCR_dt(pops, t=0):

     R = pops[0]
     C = pops[1]
     K = 10
     dRdt = r * R * (1-(R/K)) - a * R * C 
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

p.plot(t, pops[:,0], 'g-', label='Resource density') # Plot
p.plot(t, pops[:,1]  , 'b-', label='Consumer density')
p.grid()
p.legend(loc='best')
p.xlabel('Time')
p.ylabel('Population density')
p.title('Consumer-Resource population dynamics')
p.show()# To display the figure

f2 = p.figure()
p.plot(pops[:,0], pops[:,1], 'r-', label='Resource density') # Plot

p.grid()
p.legend(loc='best')
p.xlabel('Resource density')
p.ylabel('Resource density')
p.title('Consumer density')
p.show()# To display the figure

f1.savefig('/Users/zhangxiaoya/CMEECourseWork/WEEK7/Result/LV2_mode.pdf') #Save figure
f2.savefig('/Users/zhangxiaoya/CMEECourseWork/WEEK7/Result/LV2_mode1.pdf') #Save figure
