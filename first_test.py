import numpy as np
from sklearn.model_selection import train_test_split
from sklearn import datasets
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import f1_score
from python.xsklearn.ensemble import Bert,Broof
from python.xsklearn.neighbors import LazyNNRF,LazyNNBroof,LazyNNBert
from sklearn.datasets import load_svmlight_file
from sklearn.model_selection import KFold, StratifiedKFold

def get_data(file):
    data = load_svmlight_file(file)
    return data[0], data[1]

def testing(clf,X_train,X_test,y_train,y_true):

    clf.fit(X_train, y_train)

    y_pred = clf.predict(X_test)

    print(f1_score(y_true, y_pred, average='macro'))

import nltk
import sklearn

print('The nltk version is {}.'.format(nltk.__version__))
print('The scikit-learn version is {}.'.format(sklearn.__version__))

# Get the dataset
#iris = datasets.load_breast_cancer()
#X, y = iris.data, iris.target

# Divide in train and test
X,y = get_data('../datasets/spambase.svm')

#skf = StratifiedKFold(n_splits=2)

X_train, X_test, y_train, y_true = train_test_split(X, y, test_size=0.30, random_state=42)

print(y_train.shape)
print(y_train)

y_train = np.zeros(len(y_train))
y_true = np.zeros(len(y_true))

#print('\n\n RF \n\n')
# Create and train the classifier
#clf = RandomForestClassifier()

#testing(clf,X_train,X_test,y_train,y_true)

# brf = Bert(n_trees=8)
# print('\n\n BERT \n\n')
# testing(brf,X_train,X_test,y_train,y_true)

# brf = Broof(n_trees=8)
# print('\n\n BROOF \n\n')
# testing(brf,X_train,X_test,y_train,y_true)

# lazy = LazyNNRF(n_neighbors=50,n_gpus=1)
# print('\n\n LazyNNRF - 50  \n\n')
# testing(lazy,X_train,X_test,y_train,y_true)


#lazy = LazyNNRF(n_gpus=4)
#print('\n\n LazyNNRF - 30 \n\n')
#testing(lazy,X_train,X_test,y_train,y_true)

# if(np.sum([0,0,0,0]) == 0):
#     print('ERROR--')
#     print([0,0,0,0])
#     print( '---' )
#     print([0,0,0,0])

# print(np.average([0, 0.99813432835820892, 1.0, 0.0], weights=[0,0,0,0]))

# oob_score = 0.999999999999999999999999999999999999
# n_classes_ = 2

# value = np.log((1. - oob_score) / oob_score) + np.log(n_classes_ - 1)
# print(value)

lazy = LazyNNBroof()
print('\n\n LazyNNBroof\n\n')
testing(lazy,X_train,X_test,y_train,y_true)

# lazy = LazyNNBert()
# print('\n\n LazyNNBert\n\n')
# testing(lazy,X_train,X_test,y_train,y_true)


