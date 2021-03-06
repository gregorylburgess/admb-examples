#  A time series of Poisson counts; Polio data

Filed under:  [State space model][1], [MedicaBiometrics][2], [Count data][3], [Generalized Linear Mixed Models][10]

A serially correlated time series of Poisson counts using a GLMM framework

### **Model description**
As an example of a discrete valued time series we use the 'polio data' considered by [Kuk & Cheng (1999)][4]. It is assumed that _y<sub>i</sub>_ has a Poisson (lambda<sub>i</sub>) distribution, where 
<br/>
<img src="http://latex2png.com/output//latex_654cff27be7505f1ee7fcd17d114e389.png" alt="[log(lambda_i) = x_ib+u_i" width="200" height="25">


Here, **X<sub>i</sub>** is a covariate vector, **b** is a vector of regression parameters and **u<sub>i</sub>** is a first order autoregressive process.


### Details   
[polio.pdf][5]

### Files
* [polio.tpl][6]: Model file
* [polio.dat][7]: Data file
* [polio.pin][8]: Starting values for the numerical optimizer  
* [polio.par][9]: Result file (what you get when you compile and run your model)  


[1]: ./../../../state-space-models
[2]: ./../../../by-field-of-application/medical-biometrics
[3]: ./../../../glmm-generalized-linear-mixed-models/count-data/
[4]: .citations.html#kuk:chen:1999
[5]: polio.pdf
[6]: polio.tpl
[7]: polio.dat
[8]: polio.pin
[9]: polio.par
[10]: ./../../
