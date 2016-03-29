# Scilab
compand(in,param,v,charac)

This module is compatible with Scilab 5.5.2 and above.

Tested on March 28th 2015 

Ali N.M. Rumane - March 2015

Source code for mu-law or A-law compressor/expander

Syntax is as follows:
compand(in,param,v,charac)
where,
  in is the input vector
  param is the papameter for either mu-law or A-law
  v is the maximum magnitude of the input signal
  charac can be either
    mu/compressor
    mu/expander
    A/compressor
    A/expander
  
It can also be written as 
  compand(in,param,v) which implements a µ-law compressor
