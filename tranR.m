function [ reward ] = tranR (que1,que2,action,que1Next,que2Next,rewardfor1,rewardfor2)
%UNTITLED3 Summary of this function goes here
% Detailed explanation goes here
que1 = que1 + 1 ;
que2 = que2 + 1 ;
que1Next = que1Next + 1 ;
que2Next = que2Next + 1 ;
if (action == 1 ) %
reward = rewardfor1(que2Next,que1Next,que2,que1);
end
if (action == 2 )
reward = rewardfor2(que2Next,que1Next,que2,que1);
end
end