
libname a 'C:\Users\Barry\Documents\SAS Playground\SAS and R\Data Sets';
run;



*=======================================================================;

*Simulating a RCBD experiment ===========================================BEGIN;

*=======================================================================;

*10 TREATMENTS;

*3 REPLICATION;

proc plan seed=123456;

factors GEN=10 ordered REP=3 ordered/noprint;

output out=RCBD_TEST

GEN cvals=('GEN1' 'GEN2' 'GEN3' 'GEN4' 'GEN5' 'GEN6' 'GEN7' 'GEN8' 'GEN9' 'GEN10')

REP nvals=(1 2 3);

run;

 

*Simulating VARIABLES - BEGIN;

data RCBD_TEST; set RCBD_TEST;

  call streaminit(8789); /*SEED= 8789*/

VAR1=rand('normal',110, 15); /*MEAN 110: STD: 15*/

run;

data RCBD_TEST; set RCBD_TEST;

  call streaminit(907854); /*SEED= 907854*/

VAR2=rand('normal',3000, 751);run; /*MEAN 3000: STD: 751*/

*Simulating VARIABLES - END;

*=======================================================================;

*Simulating and RCBD experiment =====================================END;

*=======================================================================;

 

*Printing dataset, first 6 observations of simulated dataset:;

proc print data=RCBD_TEST (obs=6); run;


* Save as permanent SAS data set;


data a.RCBD_TEST; set RCBD_TEST;
run;
