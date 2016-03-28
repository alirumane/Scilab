// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C)2015 - Ali N.M. Rumane
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
// =============================================================================
// =============================================================================
//Syntax
//out = compand(in,param,v) 
//out = compand(in,Mu,v,'mu/compressor') 
//out = compand(in,Mu,v,'mu/expander') 
//out = compand(in,A,v,'A/compressor') 
//out = compand(in,A,v,'A/expander') 

//where in is input vector, typical value for μ is 255 and that of A is 87.5, v 
//is the input signal's maximum magnitude
//Output

//μ-Law Compression and Expansion

//data = 2:2:10;
//compressed = compand(data,255,max(data),'mu/compressor')
// compressed  =
//    7.1255496    8.3581257    9.0834832    9.5993501    10. 
//expanded = compand(compressed,255,max(data),'mu/expander')
// expanded  =
//    2.    4.    6.    8.    10. 

//A-Law Compression and Expansion

//data = 1:5;
//compressed = compand(data,87.6,max(data),'a/compressor')
// compressed  =
//    2.9867715    3.4933858    3.7897361    4.  
//expanded = compand(compressed,87.6,max(data),'a/expander')
// expanded  = 
//    1.    2.    3.    4.  

// =============================================================================
funcprot(0);
function[out]=compand(in,param,v,charac)
v=max(in);
select charac
//    mu/expander
    case 'mu/expander' then
        Mu=param
        out =(1*v/Mu)*((1+Mu).^(abs(in/v))-1).*sign(in)
//        a/compressor
    case 'a/compressor' then
        A=param;
        inp=in;
        datas=in;    
        for inp=0:abs((v/A))
            out=A*in/(1+log(A)).*sign(in);
        end        
        for inp=abs((v/A)):abs(v)
            out=v*(1+log(A*in/v))/(1+log(A)).*sign(in);
        end  
//        a/expander
    case 'a/expander' then
        A=param;
        inp=in;
        for inp=0:(1/(1+log(A/v)))
            out=abs(in)*(1+log(A))/A.*sign(in)
            end
        for inp=(1/(1+log(A/v))):v
            out=v*exp(abs(in/v)*(1+log(A))-1)/A.*sign(in)
        end
//        mu/compressor
    else
        Mu=param;
        datas=in;
        out=v*log(1+(Mu*in/v))/(log(1+Mu)).*sign(in);
end  
endfunction
