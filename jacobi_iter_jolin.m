function [x_new, Relative_Error] = ...
         jacobi_iter_jolin (A, x_guess, b, max_iter_num, Criteria)

% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% Example 
% [x_new, Relative_Error] = jacobi_iter_jolin (A, x_guess, b, 100, 10^(-5))
%
% Updated on 5 Nov, 2018
% Yu-Lin Tsai, National Central University
% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

    % A = D - L - U
    D = diag(diag(A));
    U = -(triu(A)-D);
    L = -(tril(A)-D);

    % for first time
    x_old = x_guess;
       
    for kk = 1:max_iter_num

        % Jacobi Iteration -> x_new = inv(D) * ( (L+U)*x_old + b );
        x_new = D \( (L+U)*x_old + b);

        % Relative Error of 1-norm vector calculation
        Relative_Error = norm(x_new-x_old,1)/norm(x_new,1); 

        % If Relative Error is smaller enough -> leave this loop
        if (Relative_Error <= Criteria), break; end;  

        % Update for previous-step x
        x_old = x_new;

        % Progress output in the Screen 
        fprintf('  iteration: %04d, Relative Error: %10.5f\n', kk, Relative_Error);

    end


end