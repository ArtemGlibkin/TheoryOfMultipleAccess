p = [ 0.7 0.2 0.1; 0.1 0.6 0.3; 0 0 1];
%p = [0 0 1, 0.1 0.6 0.3 0 0 1];
states = 3;

expCount = 10000000;

step = 15;
startState = 1;
% results = zeros(states, 1);
results = 0;
for e=1:expCount
    curState = startState;
    counter = 1;
    while 1
        r = rand();
        pbuf = 0;
        for(s = 1:states)
            pbuf = pbuf + p(curState, s);
            if(r < pbuf)
                curState = s;
                break;
            end;
        end;
        if(curState ~= 3)
            counter = counter + 1; 
        else
            break;
        end;
    end;
    results = results + counter;
end;

avtime = results/expCount;
p2 = -[ p(1,1:2); p(2,1:2)];
p2 = p2 + eye(2);
p2 = p2^-1;
b =[1;1];
x = p2 * b;

