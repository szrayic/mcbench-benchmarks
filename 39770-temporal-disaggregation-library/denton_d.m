% PURPOSE: Demo of denton()
%          Temporal disaggregation with indicators.
%          Multivariate model with transversal constraint
% 		   Denton method, addititive or proportional variants.
%---------------------------------------------------
% USAGE: denton_d
%---------------------------------------------------

close all; clear all; clc;

% Low-frequency data: simulated series.
Y=[	3450.43125      5274.37125
   	3386.18575      5250.31725
 	3306.98600      5320.25325
   	3187.48200      5299.46400
	3050.46300      5287.22150
	2884.09975      5381.92000
	2816.75575      5365.06800
	2746.28750      5373.62875
	2653.04575      5451.18825
	2697.38225      5780.78625
	2763.58125      6027.86450
	2804.39075      6261.22400
	2897.97500      6628.52500
	2978.10000      6894.80000
	2890.12500      7100.72500
	2804.17500      7113.05000
	2539.82500      7011.37500
	2473.75250      7046.74500
	2486.05750      7315.17750
	2500.37500      7643.81750
	2580.30000      7874.17500
	2707.97500      8129.25000 ];
 
  % High-frequency indicators: simulated series
  
x=[ 1186.574 1504.082
    1238.540 1495.235
	1274.279 1483.496
	1252.096 1475.704
	1204.855 1483.244
	1194.790 1486.441
	1195.407 1470.882
	1170.759 1483.880
	1125.983 1506.143
	1151.863 1525.515
	1135.534 1561.004
	1099.589 1545.068
	1061.899 1534.002
	1075.763 1549.683
	1055.326 1563.368
	1009.934 1545.267
	965.876 1550.251
	963.514 1542.591
	978.405 1568.043
	973.989 1554.034
	942.769 1566.402
	956.839 1572.432
	948.623 1561.920
	918.327 1555.480
	871.086 1546.179
	922.435 1539.797
	923.565 1553.848
	875.399 1554.311
	834.114 1565.907
	841.714 1571.492
	844.282 1583.151
	802.175 1557.854
	761.507 1545.508
	786.154 1560.506
	805.256 1563.104
	808.460 1604.998
	787.533 1602.308
	828.387 1630.473
	881.757 1630.790
	898.979 1647.016
	900.281 1674.479
	915.501 1678.322
	945.340 1698.999
	967.970 1689.902
	952.349 1694.108
	991.100 1689.400
   1057.000 1673.600
   1082.100 1663.600
   1087.200 1671.700
   1099.000  1687.700
   1172.800  1686.900
   1176.500  1673.700
   1174.100  1673.300
   1214.600  1689.700
   1245.100  1686.800
   1247.900  1689.600
   1258.800  1703.000
   1275.800  1725.600
   1290.800  1749.300
   1268.500  1738.000
   1209.500  1791.800
   1215.900  1768.500
   1195.400  1765.000
   1164.400  1735.242
   1124.000  1710.300
   1100.600  1705.700
   1088.800  1699.800
   1040.500  1698.700
   1003.400  1677.900
   1062.980  1670.470
   1078.170  1695.710
   1090.180  1684.300
   1119.260  1704.470
   1139.140  1699.300
   1139.380  1715.960
   1140.380  1750.880
   1116.430  1738.950
   1154.180  1738.420
   1203.210  1763.550
   1228.100  1760.100
   1219.000  1762.800
   1254.100  1751.700
   1255.100  1736.100
   1242.700  1734.900
   1240.100  1749.100
   1295.900  1768.100
   1330.400  1785.700
   1361.900  1760.500 ]; 
 
% High-frequency constraint: simulated series.
z=[ 8735.5601
	 8716.5374
	 8713.7042
	 8733.4082
	 8685.4462
	 8627.3769
	 8634.5785
	 8598.6104
	 8620.8358
	 8585.2433
	 8657.9851
	 8644.8928
	 8545.9077
	 8493.3290
	 8471.3847
	 8437.1626
	 8362.6750
	 8301.3507
	 8365.3662
	 8321.3461
	 8277.1785
	 8242.7517
	 8288.9047
	 8255.2441
	 8133.3897
	 8165.2629
	 8226.6295
	 8202.0129
	 8147.5304
	 8115.5680
	 8163.6510
	 8052.9156
	 8028.6765
	 8028.0261
	 8140.9328
	 8219.3006
	 8287.8952
	 8422.4330
	 8569.1627
	 8633.1832
	 8656.3902
	 8708.7781
	 8884.2926
	 8916.3220
	 8956.0055
	 8968.3155
	 9135.2169
	 9202.9211
	 9275.8740
	 9457.8120
	 9691.8565
	 9680.4575
	 9751.2236
	 9840.1127
	 9962.5084
	 9937.7553
	 9938.9183
	 9983.8893
    10061.9404
	 9978.6520
	 9935.1234
	 9967.1174
	 9982.7378
	 9783.9214
	 9584.8233
	 9563.7539
	 9580.4399
	 9475.7829
	 9423.6575
	 9526.9037
	 9585.1713
	 9546.2574
	 9654.4768
	 9782.8405
	 9877.9514
	 9889.6713
	 9953.2639
	10115.1846
   10242.7806
   10265.5409
   10327.6454
   10423.2176
   10516.5314
   10550.5056
   10694.6629
   10798.2785
   10926.7326
   10929.2260 ];

% ---------------------------------------------
% Inputs for td library.

% Type of aggregation.
ta = 2;   
% Minimizing the volatility of d-differenced series.
d = 1;
% Frequency conversion.
sc = 4;    
% Variant: 1=additive, 2=proportional. [Optional]
op1 = 2;
% Name of ASCII file for output.
file_sal = 'td.sal';

% Calling the function: output is loaded in a structure called res.
res=denton(Y,x,z,ta,sc,d,op1);

% Calling printing function.
tdprint(res,file_sal);
edit td.sal;

% Calling graph function.
tdplot(res);
