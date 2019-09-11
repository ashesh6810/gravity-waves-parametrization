import numpy as np
import pandas as pd
import scipy.io as sio

lat1 = np.load('lat1.npy')
lon1 = np.load('lon1.npy')
tim1 = np.load('tim1.npy')

lat2 = np.load('lat2.npy')
lon2 = np.load('lon2.npy')
tim2 = np.load('tim2.npy')

latlontim1 = pd.DataFrame(np.vstack([lat1,lon1,tim1]).transpose(),columns = ['Lat','Lon','Time'])
latlontim2 = pd.DataFrame(np.vstack([lat2,lon2,tim2]).transpose(),columns = ['Lat','Lon','Time'])

look_up_y1=latlontim1.values
look_up_y2=latlontim2.values

print(np.shape(look_up_y1))
print(np.shape(look_up_y2))

sio.savemat('look_up_y1.mat', {'look_up':look_up_y1})
sio.savemat('look_up_y2.mat', {'look_up':look_up_y2})
