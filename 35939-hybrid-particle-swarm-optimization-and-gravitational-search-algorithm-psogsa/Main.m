%PSOGSA source code v2.0, Generated by SeyedAli Mirjalili, 2011. 
%Adopted from: S. Mirjalili, S.Z. Mohd Hashim, �A New Hybrid PSOGSA 
%Algorithm for Function Optimization, in IEEE International Conference 
%on Computer and Information Application?ICCIA 2010), China, 2010, pp.374-377.

clear all
clc

N = 30;                        % Size of the swarm " no of objects "
Max_Iteration  = 1000;              % Maximum number of "iterations"

Benchmark_Function_ID=1 %Benchmark function ID

[gBestScore,gBest,GlobalBestCost]= PSOGSA(Benchmark_Function_ID, N, Max_Iteration)

gBest
gBestScore
semilogy(GlobalBestCost,'-r');
title(['\fontsize{12}\bf Benchmark Function: F',num2str(Benchmark_Function_ID)]);
xlabel('\fontsize{12}\bf Iteration');ylabel('\fontsize{12}\bf Fitness(Best-so-far)');
legend('\fontsize{10}\bf PSOGSA',1);