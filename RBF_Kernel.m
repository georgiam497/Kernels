function [outputArg1] = RBF_Kernel(inputArg1,inputArg2)
% Get RBF Kernel Matrix - also known as Gram Matrix
% We provide 2 input variables:
% inputArg1 - this is a table of observations without the label/target
% inputArg2 - this is sigma squared 

outputArg1 = [];

% size of training set
n=length(inputArg1);

%creating the RBF kernel through for loops
for i=1:n
    for j=i:n  % our j value should start with every iteration at =i , the reason is that the matrix is symmetric
       tempnorm=norm((inputArg1(i,:)- inputArg1(j,:)));
       K(i,j)= exp(- tempnorm^2 /inputArg2) ;
       K(j,i)=K(i,j);    %symmetric matrix
    end
end     

outputArg1= K;
end