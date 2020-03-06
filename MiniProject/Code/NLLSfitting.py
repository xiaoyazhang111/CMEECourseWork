import pandas as pd
import scipy as sc
import matplotlib.pylab as pl
import seaborn as sns
import math
import numpy as np

df1 = pd.read_csv("/Users/zhangxiaoya/CMEECoursework/MiniProject/Data/data.csv")
df = pd.read_csv("/Users/zhangxiaoya/CMEECoursework//MiniProject/Data/ID.csv")

#transfer df1 (Data list)and df(ID list) to dataframe
df1 = pd.DataFrame(df1)
df = pd.DataFrame(df)
df.to_csv('/Users/zhangxiaoya/CMEECoursework//MiniProject/Data/newnewID.csv',header=True, index=True)

allStape = []
allPoint = []
Rmax = []
A = []
Nmax = [] 
Tlag = []
b = []
IDList = []
for j in range(0,df.shape[0]):
    data_subsetone = df1[df1['ID'] == df.iat[j,1]]
    IDs = df.iat[j,1]
    IDList.append(IDs)
    #sns.lmplot("Time", "PopBio", data = data_subsetone, fit_reg = False)
    #output data size of the each ID
    #print(data_subsetone.shape[0])
    #get time of the first ID as x, sort them in small to large order
    x = pd.DataFrame(data_subsetone['Time'])
    x = x.sort_index(ascending=False)
    #get popbio of the first ID as y, sort them in small to large order
    y = pd.DataFrame(data_subsetone['PopBio'])
    y = y.sort_index(ascending=False)
    #calculate the slop by two point, the first and the second
    stape = (y.iat[0,0]-y.iat[1,0]/x.iat[0,0]-x.iat[1,0])  
    print(stape)
    yy = y.iat[1,0]
    xx = x.iat[1,0]
    pointList = []
    N0List = []
    NmaxList = []
    N0=y.iat[0,0]
    Nmax = y.iat[y.shape[0]-1,0]
    for i in range(1,data_subsetone.shape[0]-1):
        stape2 = (y.iat[i,0]-y.iat[i+1,0])/(x.iat[i,0]-y.iat[i+1,0])
        #print(stape2)
        if stape > stape2:
            stape = stape
        else:
            stape = stape2
            yy = y.iat[i,0]
            xx = x.iat[i,0]
            point = (xx,yy)
            pointList.append(point)
            print(pointList[-1])
    #change list into dataframe 
    pointList = pd.DataFrame(pointList)
   
    b1 = yy - stape*xx  
    Tlag1 = (N0-b1)/stape
    Rmax1 = stape
    if N0 > 0:
        A1 = math.log(Nmax)/math.log(N0)
    else:
         print('Invalid data!')
    allStape.append(stape)
    allPoint.append([xx,yy])
    Tlag.append(Tlag1)
    Rmax.append(Rmax1)
    A.append(A1)
    b.append(b1)
    N0List.append(N0)
    NmaxList.append(Nmax)

Rmax = pd.DataFrame(Rmax)
N0List = pd.DataFrame(N0List)
NmaxList = pd.DataFrame(NmaxList)
Tlag = pd.DataFrame(Tlag)
A = pd.DataFrame(A)
b = pd.DataFrame(b)
IDList = pd.DataFrame(IDList)


finalData = pd.concat([IDList,N0List,NmaxList,Rmax,A,b,Tlag], axis = 1 )
finalData.columns = ['ID','N0','NMAX','RMAX', 'A','b','TLAG']

finalData.to_csv('/Users/zhangxiaoya/CMEECoursework//MiniProject/data/LIST.csv',header=True,index=True)
finalData.to_csv('/Users/zhangxiaoya/CMEECoursework//MiniProject/result/LIST.csv',header=True,index=True)