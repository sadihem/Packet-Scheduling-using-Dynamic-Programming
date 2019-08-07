function [ matrix ] = applyReward ( matrix,q2,q1,action)
%UNTITLED Summary of this function goes here
% Detailed explanation goes here
%q2s are buffer 2 q1s are buffer 1
if (action == 1 )
if ((q2 == 1 ) & (q1 == 1 ))
matrix(q2,q1,q2,q1) = 0 ;
matrix(q2 + 1 ,q1,q2,q1) = 0 ;
end
if ((q2 == 1 ) & (q1 < 9) & (q1 ~= 1 ))
matrix(q2,q1 - 1 ,q2,q1) = 1 ;
matrix(q2,q1,q2,q1) = 1 ;
matrix(q2 + 1 ,q1,q2,q1) = 1 ;
matrix(q2 + 1 ,q1 - 1 ,q2,q1) = 1
end
if ((q2 < 9) & (q1 == 1 ) & (q2 ~= 1 ))
matrix(q2,q1,q2,q1) = 0 ;
matrix(q2 + 1 ,q1,q2,q1) = 0 ;
end
if ((q2 == 1 ) & (q1 == 9 ))
matrix(q2,q1 - 1 ,q2,q1) = 1 ;
matrix(q2,q1,q2,q1) = 1 ;
matrix(q2 + 1 ,q1,q2,q1) = 1 ;
matrix(q2 + 1 ,q1 - 1 ,q2,q1) = 1
end
if ((q2 == 9 ) & (q1 == 1 ))
matrix(q2,q1,q2,q1) = 0 + .6 *- 5 ;
matrix(q2,q1 + 1 ,q2,q1) = 0 + .6 *- 5 ;
end
%------------------------------------
%Middle
if ((q2 > 1) & (q1 > 1))
if ((q2 < 9) & (q1 < 9))
matrix(q2,q1 - 1 ,q2,q1) = 1 ;
matrix(q2,q1,q2,q1) = 1 ;
matrix(q2 + 1 ,q1,q2,q1) = 1 ;
matrix(q2 + 1 ,q1 - 1 ,q2,q1) = 1
end
%------------------------------------
%Fulls
if ((q2 == 9 ) & (q1 < 9) & (q1 ~= 1 ))
matrix(q2,q1 - 1 ,q2,q1) = 1 + .60 * ( - 5 );
matrix(q2,q1,q2,q1) = 1 + .60 * ( - 5 )
end
if ((q2 < 9) & (q1 == 9 ) & (q2 ~= 1 ))
matrix(q2,q1 - 1 ,q2,q1) = 1 ; %nothing
matrix(q2 + 1 ,q1 - 1 ,q2,q1) = 1 ; %#2 arrival
matrix(q2,q1,q2,q1) = 1 ; %#1 arrival
matrix(q2 + 1 ,q1,q2,q1) = 1 %#both arrival
end
if ((q2 == 9 ) & (q1 == 9 ))
matrix(q2,q1 - 1 ,q2,q1) = 1 + .60 * ( - 5 );
matrix(q2,q1,q2,q1) = 1 + .60 * ( - 5 )
end
end
end
if (action == 2 )
if ((q2 == 1 ) & (q1 == 1 ))
matrix(q2,q1,q2,q1) = 0 ;
matrix(q2 + 1 ,q1,q2,q1) = 0 ;
end
if ((q2 == 1 ) & (q1 < 9) & (q1 ~= 1 ))
matrix(q2,q1,q2,q1) = 0 ;
matrix(q2 + 1 ,q1,q2,q1) = 0 ;
end
if ((q2 < 9) & (q1 == 1 ) & (q2 ~= 1 ))
matrix(q2 - 1 ,q1,q2,q1) = 1 ;
matrix(q2,q1,q2,q1) = 1 ;
matrix(q2,q1 + 1 ,q2,q1) = 1 ;
matrix(q2 - 1 ,q1 + 1 ,q2,q1) = 1
end
if ((q2 == 1 ) & (q1 == 9 ))
matrix(q2,q1,q2,q1) = 0 + .3 *- 5 ;
matrix(q2 + 1 ,q1,q2,q1) = 0 + .3 *- 5 ;
end
if ((q2 == 9 ) & (q1 == 1 ))
matrix(q2 - 1 ,q1,q2,q1) = 1 ;
matrix(q2,q1,q2,q1) = 1 ;
matrix(q2,q1 + 1 ,q2,q1) = 1 ;
matrix(q2 - 1 ,q1 + 1 ,q2,q1) = 1
end
%------------------------------------
%Middle
if ((q2 > 1) & (q1 > 1))
if ((q2 < 9) & (q1 < 9))
matrix(q2 - 1 ,q1,q2,q1) = 1 ;
matrix(q2,q1,q2,q1) = 1 ;
matrix(q2,q1 + 1 ,q2,q1) = 1 ;
matrix(q2 - 1 ,q1 + 1 ,q2,q1) = 1
end
%------------------------------------
%Fulls
if ((q2 == 9 ) & (q1 < 9) & (q1 ~= 1 ))
matrix(q2 - 1 ,q1,q2,q1) = 1 ; %nothing
matrix(q2 - 1 ,q1 + 1 ,q2,q1) = 1 ; %#2 arrival
matrix(q2,q1,q2,q1) = 1 ; %#1 arrival
matrix(q2,q1 + 1 ,q2,q1) = 1 %#both arrival
end
if ((q2 < 9) & (q1 == 9 ) & (q2 ~= 1 ))
matrix(q2 - 1 ,q1,q2,q1) = 1 + .30 * ( - 5 );
matrix(q2,q1,q2,q1) = 1 + .30 * ( - 5 )
end
if ((q2 == 9 ) & (q1 == 9 ))
matrix(q2 - 1 ,q1,q2,q1) = 1 + .30 * ( - 5 );
matrix(q2,q1,q2,q1) = 1 + .30 * ( - 5 )
end
end
end