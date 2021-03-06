#  The basic SV model and simple extensions

Filed under: [Stochastic Volatility Collection][10]

The basic SV model can be written as (alternative versions are also used):

<img src="./eq1.png" alt="Xt = σX exp(h2) εt" width="125" height="25">

<img src="./eq2.png" alt="ht 1 = φht σηt" width="180" height="25">

where εt and ηt are iid standard normal, X<sub>t</sub> is return and h<sub>t</sub> log-variance, both centralized, at time t.


The model captures important properties of financial returns like volatility clustering and heavy tailed distribution of returns. Still, the basic model is not always able to fully capture the high kurtosis often found in practice. In the SV-t model a standardized t-distribution (with ν > 2 degrees of freedom), rather than a normal distribution, is used for  epsilon in (1). This allows for heavier tails in returns. In order to also model skewness, a skewed distribution can be chosen for epsilon. In the SV-st model a skewed t-distribution is used. This distribution has an extra parameter, lambda, compared to the t-distribution. When lambda is negative, the distribution is negatively skewed.

 

In order to fit the models to data using ADMB-RE we have to find an expression for the log of the joint density function for returns and latent variables, p(**X**,**h**|θ), where θ is a parameter vector. It is then useful to find a graphical representation for the models. This makes it easier to uncover the dependence structure in the models so that we may find simple expessions for the joint density functions. The SV models considered so far can be represented graphically as: 

<img src="./fig1.jpeg" alt="Fig_1" title="SV models">

Note that:
- X<sub>t</sub> is separated from the other variables by h<sub>t</sub>. This implies that X<sub>t</sub> is conditionally independent of all other variables given h<sub>t</sub>.
- The only path to h<sub>t</sub> goes via h<sub>t-1</sub>. 
- Then h<sub>t</sub> is conditionally independent og all previous variables given h<sub>t-1</sub>.

These considerations leads to the folowing expression for the joint density:
<img src="./probability1.png" alt="joint density formula" title="joint density" width="400" height="25">


h<sub>T+1</sub> is not strictly needed here, but will be needed in later models and is for consistency also included here. 

For the models considered so far:

<img src="./h1.png" alt="h1" title="h1" width="200" height="25">

 and ,
 
 
<img src="./h_t_1.png" alt="h2" title="h2" width="200" height="25">

 while the distribution of X<sub>t</sub>|h<sub>t</sub> depends on the distribution used for ε<sub>t</sub>.

It is then easy to specify log p(<strong>X</strong>, <strong>h</strong>|θ), see tpl files for how this can be done for the three models:

> [sdv_plain.tpl][2]
>
> [sdv_t.tpl][3]
>
> [sdv_t_skw.tpl][4]

  
The par-files contain estimated parameters and volatilities. 

> [sdv_plain.par][5]
>
> [sdv_t.par][6]
>
> [sdv_t_skw.par][7]



###Files
* [sdv_plain.tpl][2]
* [sdv_plain.par][5]
* [sdv_t.tpl][3]
* [sdv_t_skw.tpl][4]
* [sdv_t.par][6]
* [sdv_t_skw.par][7]
  
  
[2]: ./sdv_plain.tpl
[3]: ./sdv_t.tpl
[4]: ./sdv_t_skw.tpl
[5]: ./sdv_plain.par
[6]: ./sdv_t.par
[7]: ./sdv_t_skw.par
[10]: ./../
