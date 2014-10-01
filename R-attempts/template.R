library(RSNNS)
seed <- 2
set.seed(seed)
setSnnsRSeedValue(seed)
abalone <- read.csv(file="abalone.data")
#shuffle the vector
df <- abalone[sample(nrow(abalone)),]
dfValues <- df[,1:8]
dfTargets <- decodeClassLabels(df[,9])
#dfTargets <- decodeClassLabels(df[,5], valTrue=0.9, valFalse=0.1)
df <- splitForTrainingAndTest(dfValues, dfTargets, ratio=0.15)
#normalize data
df <- normTrainingAndTestSet(df)
model <- mlp(df$inputsTrain, df$targetsTrain, size=5, learnFunc="Quickprop", learnFuncParams=c(0.1, 2.0, 0.0001, 0.1),
maxit=500, inputsTest=df$inputsTest, targetsTest=df$targetsTest)
#model <- mlp(df$inputsTrain, df$targetsTrain, size=5, learnFunc="BackpropBatch", learnFuncParams=c(10, 0.1),
# maxit=100, inputsTest=df$inputsTest, targetsTest=df$targetsTest)
#model <- mlp(df$inputsTrain, df$targetsTrain, size=5, learnFunc="SCG", learnFuncParams=c(0, 0, 0, 0),
# maxit=30, inputsTest=df$inputsTest, targetsTest=df$targetsTest)
#model <- rbfDDA(df$inputsTrain, df$targetsTrain)
#model <- elman(df$inputsTrain, df$targetsTrain, size=5, learnFuncParams=c(0.1), maxit=100, inputsTest=df$inputsTest, targetsTest=df$targetsTest)
#model <- rbf(df$inputsTrain, df$targetsTrain, size=40, maxit=200, initFuncParams=c(-4, 4, 0.0, 0.2, 0.04),
# learnFuncParams=c(1e-3, 0, 1e-3, 0.1, 0.8), linOut=FALSE)
#model <- rbf(df$inputsTrain, df$targetsTrain, size=40, maxit=600, initFuncParams=c(0, 1, 0.0, 0.2, 0.04),
# learnFuncParams=c(1e-5, 0, 1e-5, 0.1, 0.8), linOut=TRUE)
##experimental..:
##model <- rbf(df$inputsTrain, df$targetsTrain, size=20, maxit=50, initFunc="RBF_Weights_Kohonen",
## initFuncParams=c(50, 0.4, 0), learnFuncParams=c(0.01, 0, 0.01, 0.1, 0.8))
#summary(model)
print("printing iterative-error.pdf")

pdf("template-iterative-error.pdf")
par(mfrow=c(2,2))
plotIterativeError(model)
dev.off()

predictions <- predict(model,df$inputsTest)

#pdf("template-regression-error.pdf")
#plotRegressionError(df$targetsTest[,2], predictions[,2])
#dev.off()

confusionMatrix(df$targetsTrain,fitted.values(model))
confusionMatrix(df$targetsTest,predictions)

pdf("template-ROC-fitted.pdf")
plotROC(fitted.values(model)[,2], df$targetsTrain[,2])
dev.off()

pdf("template-ROC-predictions.pdf")
plotROC(predictions[,2], df$targetsTest[,2])
dev.off()

#confusion matrix with 402040-method
confusionMatrix(df$targetsTrain, encodeClassLabels(fitted.values(model),method="402040", l=0.4, h=0.6))
model
weightMatrix(model)
summary(model)
extractNetInfo(model)
