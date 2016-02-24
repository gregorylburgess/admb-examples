#  Extension: correlated RE's

Filed under:  [Correlated RE's][1]

Add random effects to all 3 phi's, and attempt to estimate correlations

The purpose of this example is to show one way of implementing correlated random effects. The example is supposed to be a template for building models with correlated random effects, AND THE PROVIDED DATASET IS NOT MEANT TO GIVE ANY MEANINGFUL RESULTS. As a starting point we take the logistic growth-curve model studied the [ orange data ][2] example. In that model there are three parameters (f2, f2, f3), of which only f1 is associated with a random effect. Here, we extend the model by including a random effect for all three parameters, and the random effects are allowed to be correlated as explained in the ADMB-RE.

[1]: http/www.admb-project.or@@search?Subject:list=Correlated RE's
[2]: orangorange.html