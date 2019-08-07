clear all ,
clc
state2state = zeros ( 9 , 9 , 9 , 9 )
rewardfor1 = zeros ( 9 , 9 , 9 , 9 )
rewardfor2 = zeros ( 9 , 9 , 9 , 9 )
policy = zeros ( 9 , 9 )
values = zeros ( 9 , 9 )
none= .7 * .4
just1= .3 * .4
just2= .6 * .7
both= .6 * .3
for i = 1 : 9
for j = 1 : 9
state2state = applyProb(state2state, i , j );
end
end
stateDone = 1
for i = 1 : 9
for j = 1 : 9
rewardfor1 = applyReward(rewardfor1, i , j , 1 );
end
end
reward1Done = 1
for i = 1 : 9
for j = 1 : 9
rewardfor2 = applyReward(rewardfor2, i , j , 2 );
end
end
%randomize policy
for i = 1 : 9
for j = 1 : 9
policy( i , j ) = 1 ;
%policy(i,j) = binornd(1,.5) + 1;
end
end
reward2Done = 1
setupDone = 1
policyIteration.m -
run setup.m
iterating = 1
total = 0 ;
while iterating == 1
total=total + 1
%evaluation
evaluating = 1
while evaluating == 1
theta = 0.001 ;
delta = 0 ;
discount = .4 ;
for q2 = 1 : 9
for q1 = 1 : 9
v = values(q2,q1);
sumOfValues = 0 ;
for nextq2 = 1 : 9
for nextq1 = 1 : 9
myProb = tranP(q1 - 1 ,q2 - 1 ,policy(q2,q1),nextq1 - 1 ,nextq2 - 1 ,state2state);
myReward = tranR(q1 - 1 ,q2 - 1 ,policy(q2,q1),nextq1 - 1 ,nextq2 - 1 ,rewardfor1,rewardfor2);
myNextVal = values(nextq2,nextq1);
sumOfValues = sumOfValues + myProb * (myReward + discount * myNextVal);
end
end
values(q2,q1) = sumOfValues;
delta = max (delta, abs (v - values(q2,q1)))
end
end
if (delta < theta)
evaluating = 0 ;
end
end
%improvment
policyStable = 1
for q2 = 1 : 9
for q1 = 1 : 9
b = policy(q2,q1);
action1sumOfValues = 0 ;
action2sumOfValues = 0 ;
for nextq2 = 1 : 9
for nextq1 = 1 : 9
myProb = tranP(q1 - 1 ,q2 - 1 , 1 ,nextq1 - 1 ,nextq2 - 1 ,state2state);
myReward = tranR(q1 - 1 ,q2 - 1 , 1 ,nextq1 - 1 ,nextq2 - 1 ,rewardfor1,rewardfor2);
myNextVal = values(nextq2,nextq1);
action1sumOfValues = action1sumOfValues + myProb * (myReward + discount * myNextVal);
end
end
for nextq2 = 1 : 9
for nextq1 = 1 : 9
myProb = tranP(q1 - 1 ,q2 - 1 , 2 ,nextq1 - 1 ,nextq2 - 1 ,state2state);
myReward = tranR(q1 - 1 ,q2 - 1 , 2 ,nextq1 - 1 ,nextq2 - 1 ,rewardfor1,rewardfor2);
myNextVal = values(nextq2,nextq1);
action2sumOfValues = action2sumOfValues + myProb * (myReward + discount * myNextVal);
end
end
if (action1sumOfValues > action2sumOfValues)
policy(q2,q1) = 1 ;
elseif (action2sumOfValues > =action1sumOfValues)
policy(q2,q1) = 2 ;
end
if (b ~= policy(q2,q1))
policyStable = 0 ;
end
end
end
if (policyStable == 1 )
iterating = 0
end
end