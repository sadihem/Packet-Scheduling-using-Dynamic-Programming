function [ matrix ] = applyProb ( matrix,row,col )
%UNTITLED Summary of this function goes here
% Detailed explanation goes here
matrix(row,col,row,col) = .28
if (row < 9),
matrix(row + 1 ,col,row,col) = .42
else
end
if (col < 9),
matrix(row,col + 1 ,row,col) = .12
end
if (row < 9),
if (col < 9),
matrix(row + 1 ,col + 1 ,row,col) = .18
end
end
if (row == 9 & col == 9 )
matrix(row,col,row,col) = 1
end
if (row ~= 9 & col == 9 )
matrix(row + 1 , 9 ,row,col) = .42 + .18
matrix(row, 9 ,row,col) = .28 + .12
end
if (row == 9 & col ~= 9 )
matrix( 9 ,col + 1 ,row,col) = .12 + .18
matrix( 9 ,col,row,col) = .28 + .42
end
end