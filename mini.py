import pandas as pd
import scipy as sc
import matplotlib.pylab as pl
import seaborn as sns

data = pd.read_csv("/Users/zhangxiaoya/CMEECoursework/Mini Project/data/ThermRespData.csv")
print("Loaded {} columns.".format(len(data.columns.values)))