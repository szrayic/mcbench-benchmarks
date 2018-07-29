function A = addcr(c, r)
% Copyright (C2010-2013) Yang XIAO, BJTU, April 16, 2010, E-Mail: yxiao@bjtu.edu.cn.
% This program can produce the Parity Check Matrices of DVBS2 codes, while
% Ref. [1] remindes you that these codes are not good as the LDPC codes IEEE802.16e
% for continuous bits' errors. 
% Refenrences:
% [1] X. Huang, Y. Xiao, J. Fan and K. Kim, Girth 4 and low minimum weights' problems of LDPC codes in DVB-S2 and solutions, 
% Proceedings of the 5th International Conference on Wireless communications, networking and mobile computing table of contents
% Beijing, China, Pages: 601-604, 2009, ISBN:978-1-4244-3692-7  
% [2]  Xiao Y., Kim K, "Alternative good LDPC codes for DVB-S2", 9th International Conference on Signal Processing, 2008. ICSP 2008. Beijing, 26-29 Oct. 2008, Page(s): 1959-1962  
% [3]  DVB-S2 standard draft ETSI EN 302 307 V1. 1. 1[S]. 2004, 06.  

M = length(c);
N = length(r);
A = zeros(M, N);
for m = 1:M
    A(m, :) = r + c(m);
end

