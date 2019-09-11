import numpy as np
import pandas as pd
#import matplotlib.pyplot as plt
#from sklearn import preprocessing
import keras
from keras.models import Sequential
from keras.layers import Dense
import scipy.io as sio

# read the auxiliary files
# define the model
trainN=1800000
testN=2000
u=sio.loadmat('DATA_FILE.mat')
input_data=u.get('data_input')
input_data=np.transpose(input_data)
output_data=u.get('data_output')
output_data=np.transpose(output_data)


Xtrain=input_data[0:trainN,:]
Ytrain=output_data[0:trainN,:]

Xtest=input_data[trainN:trainN+testN,:]
Ytest=output_data[trainN:trainN+testN,:]






def swish(x):
   beta = 1.0 #1, 1.5 or 2
   return beta * x * keras.backend.sigmoid(x)

# create model

num_hidden = 150

def make_model(nlayers):
    model = Sequential()
    model.add(Dense(num_hidden, input_dim=Xtrain.shape[1], activation=swish))
    for i in range(nlayers-1):
        model.add(Dense(num_hidden, activation=swish))
    model.add(Dense(Ytrain.shape[1], activation='linear'))
    print(model.summary())
    return model

model = make_model(10)

# scale the data

# Compile model
adam_opt = keras.optimizers.Adam(lr=0.001)
model.compile(loss='mean_squared_error', optimizer=adam_opt, metrics=['mae'])

# train the model

model.fit(Xtrain,Ytrain,epochs=5,batch_size=100)

# evaluate the model on test set

loss,mae = model.evaluate(Xtest,Ytest)
