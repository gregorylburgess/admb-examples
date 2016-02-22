library("lme4")
simfun <- function(n,beta=c(1,1),tau=2.0,
                   Cor=matrix(c(1,0.25,0.25,1),nrow=2)) {
    D <- expand.grid(id=factor(1:n),t=1:3)
    D$x <- rnorm(3*n)  # x_{it} ~ N(0,1)
    X <- model.matrix(~x,data=D)
    Z <- model.matrix(~id-1+id:x,data=D)
    b <- MASS::mvrnorm(n,mu=c(0,0),Sigma=tau^2*Cor)
    D$Y <- rbinom(nrow(D),
                  prob=plogis(X %*% beta + Z %*% c(b)),
                  size=1)
    D
}
  iseed=scan("seed")
  set.seed(iseed)
  iseed=iseed+1
  write(iseed,file="seed")

  dat=simfun(500) 
  fm <- glmer(Y~  x + ( x|id), data=dat,family=binomial)
  xout=cbind(as.vector(fixef(fm))[2],
    as.vector(sqrt(vcov(fm,useScale = FALSE)[2,2])))
  write(xout,file = "nx",sep = " ", append = TRUE)
