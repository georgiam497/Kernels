function [outputArg1] = get_polynomial_kernel(inputArg1,inputArg2,inputArg3)
%Get plynomial Kernel Matrix - also known as Gram Matrix
%We provide 3 input varibles:
%1) inputArg1 - this is a table of observations without the label/target
%2) inputArg2 - this is an integer value, d for our polynomial matrix
%3) inputArg3 -  this is the constant added to the dot product function

outputArg1 = [];

% size of training set
n=size(inputArg1,1);

%creating the kernel through for loops
for i=1:n
    for j=i:n  % our j value should start with every iteration at =i , the reason is that the matrix is symmetric- we save time & com power
       K(i,j)=((inputArg3 + (inputArg1(i,:)*inputArg1(j,:)'))^inputArg2);
       K(j,i)=K(i,j);    %symmetric matrix
    end
end     

outputArg1= K;

end



