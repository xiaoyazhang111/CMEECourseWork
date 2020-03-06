import pandas as pd
import scipy as sc
import matplotlib.pylab as pl
import seaborn as sns

data = pd.read_csv("/Users/zhangxiaoya/CMEECoursework/MiniProject/Data/LogisticGrowthData.csv")
pd.read_csv("/Users/zhangxiaoya/CMEECoursework/MiniProject/Data/LogisticGrowthMetaData.csv")
#build dataframes df and df1
df = pd.DataFrame()
df1 = pd.DataFrame()
#insert the first column named "ID", ID = "data.Species + "_" + data.Temp.map(str) + "_" + data.Medium + "_" + data.Citation"
data.insert(0, "ID", data.Species + "_" + data.Temp.map(str) + "_" + data.Medium + "_" + data.Citation)
#drop all NA value
data.dropna(how='any')
#drop all 0 and negative value
df = df[(df > 0).all(axis=1)]
#get all unique IDs
print(data.ID.unique())
#transfer all unique IDs into dataframe form
ID = pd.DataFrame(data.ID.unique())
#output size of ID 
sizeofID = ID.shape[0]
print(sizeofID)
for i in range(0,284):
    #get all data under every single ID 
    data_subset = pd.DataFrame(data[data['ID']==ID.iat[i,0]])
    #Filter out all ID size < 8
    if data_subset.shape[0] > 8:
        pd1 = pd.DataFrame(data_subset.ID.unique())
        df = pd.concat([df,pd1],ignore_index = True)
        df1 = pd.concat([df1,pd.DataFrame(data_subset)],ignore_index = True)
print(df)
print(df1)
#keep the ID and data as csv file, for later use
df1.to_csv('/Users/zhangxiaoya/CMEECoursework//MiniProject/Data/data.csv',header=True, index=True)
df.to_csv('/Users/zhangxiaoya/CMEECoursework//MiniProject/Data/ID.csv',header=True, index=True)


