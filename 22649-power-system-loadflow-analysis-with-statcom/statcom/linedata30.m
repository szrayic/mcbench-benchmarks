% Line Data of IEEE-30 Bus System..

function linedata = linedata30()

%         |  From |  To   |   R     |   X     |     B/2  |  X'mer  |
%         |  Bus  | Bus   |  pu     |  pu     |     pu   | TAP (a) |
linedata = [ 1      2       0.0192    0.0575     0.0264         1
             1      3       0.0452    0.1652     0.0204         1
             2      4       0.0570    0.1737     0.0184         1
             3      4       0.0132    0.0379     0.0042         1
             2      5       0.0472    0.1983     0.0209         1
             2      6       0.0581    0.1763     0.0187         1
             4      6       0.0119    0.0414     0.0045         1
             5      7       0.0460    0.1160     0.0102         1
             6      7       0.0267    0.0820     0.0085         1
             6      8       0.0120    0.0420     0.0045         1
             6      9       0.0       0.2080     0.0        0.978
             6     10       0.0       0.5560     0.0        0.969
             9     11       0.0       0.2080     0.0            1
             9     10       0.0       0.1100     0.0            1
             4     12       0.0       0.2560     0.0        0.932
            12     13       0.0       0.1400     0.0            1
            12     14       0.1231    0.2559     0.0            1
            12     15       0.0662    0.1304     0.0            1
            12     16       0.0945    0.1987     0.0            1
            14     15       0.2210    0.1997     0.0            1
            16     17       0.0824    0.1923     0.0            1
            15     18       0.1073    0.2185     0.0            1
            18     19       0.0639    0.1292     0.0            1
            19     20       0.0340    0.0680     0.0            1
            10     20       0.0936    0.2090     0.0            1
            10     17       0.0324    0.0845     0.0            1
            10     21       0.0348    0.0749     0.0            1
            10     22       0.0727    0.1499     0.0            1
            21     23       0.0116    0.0236     0.0            1
            15     23       0.1000    0.2020     0.0            1
            22     24       0.1150    0.1790     0.0            1
            23     24       0.1320    0.2700     0.0            1
            24     25       0.1885    0.3292     0.0            1
            25     26       0.2544    0.3800     0.0            1
            25     27       0.1093    0.2087     0.0            1
            28     27       0.0000    0.3960     0.0        0.968
            27     29       0.2198    0.4153     0.0            1
            27     30       0.3202    0.6027     0.0            1
            29     30       0.2399    0.4533     0.0            1
             8     28       0.0636    0.2000     0.0214         1
             6     28       0.0169    0.0599     0.065          1 ];