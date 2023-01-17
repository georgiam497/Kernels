function [outputArg1,outputArg2] = checkif_squarepositivedef(inputArg1,inputArg2)
% inputArg1 - square matrix
% inputArg2 - the constant added to the diagonal
% the function checks if the matrix is a square semidefinite positive matrix, if it is not it transforms into to one
% if the matrix has negative eigenvalues - the function should fix them
% (condition number of a matrix needs to be as low as possible)

%checking if square
[nrow,ncol]=size(inputArg1);
if nrow==ncol
    eigen_vals=eig(inputArg1);
    min_eigen_val=min(eigen_vals);

    if min_eigen_val >= 0
        spd_matrix= inputArg1;
        cond_num=cond(spd_matrix);
        fprintf('The Matrix Is Semipositive Definite'); % the matrix was square semipositive definite to begin with
        disp('!');
        disp('*********');

    else spd_matrix=inputArg1+ eye(nrow)*inputArg2
         initial_condnum= cond(inputArg1);
         disp('*******************');
         disp('The Initial Condition Number Is:');
         disp(initial_condnum);
         cond_num= cond(spd_matrix);
         disp('The Final Condition Number Is:');
         disp(cond_num);
         fprintf('The Matrix Was Transformed into Semipositive Definite'); %tranforms the square matrix into semipositive definite

  outputArg1 = spd_matrix;
  outputArg2= cond_num;


    end

else fprintf('The Matrix is Not Square');
     disp('*********');
    
   % gets here only if the matrix is not square

end

