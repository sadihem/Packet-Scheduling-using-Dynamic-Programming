
function [ probability ] = tranP (que1,que2,action,que1Next,que2Next,state2state)
%UNTITLED3 Summary of this function goes here
% Detailed explanation goes here
que1 = que1 + 1 ;
que2 = que2 + 1 ;
que1Next = que1Next + 1 ;
que2Next = que2Next + 1 ;
if (action == 1 ) %
if (que1 - 1 == 0 )
probability = state2state(que2Next,que1Next,que2, 1 );
else
probability = state2state(que2Next,que1Next,que2,que1 - 1 );
end
end
if (action == 2 )
if (que2 - 1 == 0 )
probability = state2state(que2Next,que1Next, 1 ,que1);
else
probability = state2state(que2Next,que1Next,que2 - 1 ,que1);
end
end
end