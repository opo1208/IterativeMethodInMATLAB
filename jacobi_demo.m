clc; clear; fclose all; close all;

% 
Criteria = 10^(-4);

A = [4 -1 -1; -2 6 1;-1 1 7 ];
x_guess = [0; 0; 0];
b = [ 3; 9;-6];
  
max_iter_num = 100;

[x_new, Relative_Error] = jacobi_iter_jolin (A, x_guess, b, max_iter_num, Criteria)