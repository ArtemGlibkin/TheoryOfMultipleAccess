p = [ 0.7 0.2 0.1; 0.1 0.6 0.3; 0.4 0.2 0.4];

states = 3;

expCount = 1000000;

step = 0;
startState = 1;
predresults = zeros(states, 1);
results = zeros(states, 1);
while(1)
    step = step + 1;
    for e=1:expCount
        curState = startState;
        for t = 1:step
            r = rand();
            pbuf = 0;
            for(s = 1:states)
                pbuf = pbuf + p(curState, s);
                if(r < pbuf)
                    curState = s;
                    break;
                end;
            end;
        end;
        results(curState) = results(curState) + 1;
    end;
    results = results / expCount;
    if((results - predresults) < 0.001)
        break;
    end;
    predresults = results;
end;
fprintf( 'Иммитационное моделирование:\n');
for r = 1:states
    fprintf( 'Стационарное распределение МЦ %f\n', results(r));
end;



tmp = p' - eye(length(p));
tmp(3,:) = [1 1 1];
tmp = tmp^-1;
b =[0;0;1];
tmp = tmp * b;
fprintf( 'Рассчет:\n');
for r = 1:states
    fprintf( 'Стационарное распределение МЦ %f\n', tmp(r));
end;