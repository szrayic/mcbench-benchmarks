C = [53.30718      98.92727       46.9855        217.84   NaN     5.868182;...
     40.36167            56         47.85         294.9    NaN    5.593333;...
     28.40         48.98571      NaN      248.1429      61.    2.401429;...
     214.62859          406.5       1006.227        1326.15    160.    119.61;...
     345.358         638.9      833.0768      907.8222      743.    57.651;... 
     135.6125           222      438.9075        497.15     265.    14.145;...
     102.441      185.6667      408.6333        NaN     140.    11.95333;...    
     22.7375          68.5        157.18        NaN      55.    4.0;...
     83.2555           79.5         NaN        NaN     120.     24.725;...
     97.259545      163.68182      NaN         NaN     163.333    23.774545;...
     89.761          113.5        NaN            241      120.     2.335;...
     129.383         215.1      150.5883        327.46       310.     1.933333;...
     52.9526        133.48          77.9      274.0889      147.5     1.561] ;

hist(C');
xlabel ('observation points');
ylabel ('C [mg/l]');
title ('measured concentrations');
legend ('Na','Cl','B','HCO_3');
