// The basic SV model

DATA_SECTION

  init_int n					// Length of time series
  int n1
  !! n1 = n+1;					// Number of states
  init_vector y(1,n)				// Time series

PARAMETER_SECTION

  init_bounded_number phi(-.9999,.9999,2)	// Autoregressian parameter
  init_bounded_number log_sigma(-3.0,3.0,2)	// log(sigma)
  init_bounded_number log_sigma_x(-10,3,1)	// log(sigma_X)	

  sdreport_number sigma2

  random_effects_vector h(1,n1,2)		// State variable

  objective_function_value g

PRELIMINARY_CALCS_SECTION
  cout << setprecision(4);

GLOBALS_SECTION

  //#include <df1b2fun.h>
  #include <time.h>
  
PROCEDURE_SECTION

  int i;	

  // Likelihood contribution from h(1)
  sf1(log_sigma,phi,h(1));

  // Likelihood contribution from h(2),...,h(n)
  for (i=2;i<=n+1;i++)
  {
    sf2(log_sigma,phi,h(i),h(i-1));
  }

  // Likelihood contribution from data
  for (i=1;i<=n;i++)
  {
    sf3(h(i),log_sigma_x,i);
  }

  if(mceval_phase())
    mcmc_out(phi,log_sigma,log_sigma_x);


SEPARABLE_FUNCTION void sf1(const dvariable& ls,const dvariable& Phi,const dvariable& h_1)
  g -=  -0.9189385332046727 -ls + 0.5*log(1-square(Phi))  - 0.5*square(h_1/mfexp(ls))*(1-square(Phi));


SEPARABLE_FUNCTION void sf2(const dvariable& ls,const dvariable& Phi,const dvariable& h_i,const dvariable& h_i1)
  g -=  -0.9189385332046727 -ls - .5*square((h_i-Phi*h_i1)/mfexp(ls));


SEPARABLE_FUNCTION void sf3(const dvariable& h_i, const dvariable& ls_x, int i)
  dvariable SD_yIh = mfexp(ls_x + 0.5*h_i);
  g -=  -0.9189385332046727  - (ls_x + 0.5*h_i) - 0.5*square(y(i)/SD_yIh);

SEPARABLE_FUNCTION void  mcmc_out(const prevariable& phi,const prevariable& log_sigma,const prevariable& log_sigma_x)
    cout << phi << " " << exp(log_sigma) << " " << exp(log_sigma_x) << endl;

REPORT_SECTION

   //////////////////////////////////////////////
   cout<<endl;
   cout<<"Clock ticks: "<<clock()<<";  Seconds: "<<clock()/CLOCKS_PER_SEC << endl;
   /////////////////

TOP_OF_MAIN_SECTION
  arrmblsize = 4000000L;
  gradient_structure::set_GRADSTACK_BUFFER_SIZE(300000);
  gradient_structure::set_CMPDIF_BUFFER_SIZE(20000);
  gradient_structure::set_MAX_NVAR_OFFSET(50850);


