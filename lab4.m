
lambda = 0.8;
tmodel = 100000;
qlim = 10;
for l = 1:15
    lambda = l/10;
queue = struct('w', {});
queuesize = 0;
n = genMessageStream(lambda, tmodel);
qsr = 0;
meandelay = 0;
k = 0;
for i = 1:length(n)
    qsr = qsr + queuesize;
    if(queuesize > 0)
        node = queue(1).w;
        queue = queue(1,2:length(queue));
        
        queuesize = queuesize - 1;
        delay = i - node;
        meandelay = meandelay + delay;
    end;
    if(n(i) > 0)
        for j = 1:n(i)
          if(queuesize + 1 < qlim)
              queuesize = queuesize + 1;
              queue(queuesize).w = i;
          else
              break;
          end;
        end;
        k = k + n(i);
    end;
end;
qsr = qsr / tmodel;
meandelay = meandelay / k;
q(l) = qsr;
m(l) = meandelay;
[mtheor(l) qtheor(l)] = theor4(lambda, qlim);
end;
l = 0.1:0.1:1.5;
figure();
hold on;
plot(l, m);
plot(l, mtheor);
title('График средней задержки');


figure();
hold on;
plot(l, q);
plot(l, qtheor);
title('График средней длины очереди');
% li.add(2);
% li.add(3);
% li.add(4);