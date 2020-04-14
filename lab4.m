
lambda = 0.8;
tmodel = 100000;
qlim = 15;
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
          if(queuesize + 1 <= qlim)
              queuesize = queuesize + 1;
              queue(queuesize).w = i;
              k = k + 1;
          else
              break;
          end;
        end;
    end;
end;
qsr = qsr / tmodel;
meandelay = meandelay / k;
% li.add(2);
% li.add(3);
% li.add(4);