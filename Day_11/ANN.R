##---------------------------------------------------------------
# Artificial Neural Networks (ANN)
##---------------------------------------------------------------

library(neuralnet)

##--------Multilayer nural network
##--------THREE CATEGORY ANN, Two hidden layer (3,2)-------------

set.seed(101)
iris1=data.frame(iris)
head(iris1)
dim(iris1)
sample.size <- 100

# get a training sample from iris of sample.size
iristrain <- iris1[sample(1:nrow(iris1), sample.size),] 
nnet_iristrain <- iristrain

# Convert categorical output to three binary variables
nnet_iristrain <- cbind(nnet_iristrain, iristrain$Species == 'setosa')
nnet_iristrain <- cbind(nnet_iristrain, iristrain$Species == 'versicolor')
nnet_iristrain <- cbind(nnet_iristrain, iristrain$Species == 'virginica')
head(nnet_iristrain)
names(nnet_iristrain)[6] <- 'setosa'
names(nnet_iristrain)[7] <- 'versicolor'
names(nnet_iristrain)[8] <- 'virginica'
head(nnet_iristrain)

# Run neuralnet function to train the neural networks using backpropagation
# hidden = vetor of integers specifying the number of hidden neurons in each layer

nn <- neuralnet(setosa+versicolor+virginica ~ 
                  Sepal.Length+Sepal.Width+Petal.Length+Petal.Width,
                data=nnet_iristrain, hidden=c(3,2), 
                algorithm = 'backprop', learningrate = 0.15,
                linear.output = F)
plot(nn)

# stepmax = the maximum steps for the training of neural network
# rep = No of repetitions for the neural network training
# as the algorithm tends to get stuck at local minima
# algorithm = "backprop"
# learning rate = rate at which algorithm learns
# threshold = threshold of the partial derivative of the error function
# linear.output = (T/F) Whether activation function is to be applied 

nn <- neuralnet(setosa+versicolor+virginica ~ Sepal.Length+Sepal.Width+Petal.Length+Petal.Width,
                data=nnet_iristrain, hidden=c(3,2), rep = 5, 
                algorithm = 'backprop', learningrate = 0.05,
                threshold = 0.01, linear.output = F)
plot(nn)

nn$act.fct # activation function
nn$err.fct # error function
nn$net.result # a list containing the overall result for every rep
nn$weights # fitted weights
nn$result.matrix # matrix of results (reached threshold, needed steps, weights)
nn$startweights # list of startweights

#----Predict--------------------------------------------
# compute function computes the output of all neurons for given x 
# for a trained neural network, uses object of class nn and rep no
# outputs for each neuron and a matrix containing overall results
# rep indicates which repetition to use

compute(nn, iris[-5], rep=1)
mypredict <- compute(nn, iris[-5],rep=1)$net.result

# Put multiple binary output to categorical output
# function to get the max id from array for each column
maxidx <- function(arr) {
  return(which(arr == max(arr)))
}
idx <- apply(mypredict, 1, maxidx)
prediction <- c('setosa', 'versicolor', 'virginica')[idx]
table(pred=prediction, true=iris$Species)

#-----------------/Multilayer neural network-----------------

#---------------Single Layered Neural Network----------------

x=matrix(c(0,0,1,0,0,1,1,1), ncol=2, byrow=TRUE)
# y=c(-1,-1,-1,1) #AND  (Training is perfect)
 y=c(0,1,1,1) #OR   (traning is perfect)
# y=c(0,1,1,0)  # EOR Exclusive OR - Either but not both (training is not pefect) 

bin.data = cbind(x,y)
colnames(bin.data)[1] <- "x1"
colnames(bin.data)[2] <- "x2"
bin.data<-rbind(bin.data,bin.data)

nn <- neuralnet(y ~ x1 + x2,data = bin.data,
                hidden=0, 
                algorithm = 'backprop', learningrate = 0.01,
                linear.output = F, rep = 3)
plot(nn)

nn$act.fct # activation function
nn$err.fct # error function
nn$net.result # a list containing the overall result for every rep
nn$weights # fitted weights
nn$result.matrix # matrix of results (reached threshold, needed steps, weights)
nn$startweights # list of startweights

mypredict <- compute(nn, bin.data[,-3], rep=1)$net.result
mypredict

#------------------/Single layered neural network------------

#------------------------------------------------------------
# Two layered network (1 Hidden Layer for EOR (XOR) 
# as one layered network not capable for predicting XOR

y=c(0,1,1,0)  

bin.data = cbind(x,y)
colnames(bin.data)[1] <- "x1"
colnames(bin.data)[2] <- "x2"
bin.data<-rbind(bin.data,bin.data)


nn <- neuralnet(y ~ x1 + x2,data = bin.data,
                hidden=2, algorithm = 'backprop', learningrate = 0.01,
                linear.output = F, rep = 3)
plot(nn)

mypredict <- compute(nn, bin.data[,-3], rep=3)$net.result
mypredict

#------------------/ANN--------------------------------------