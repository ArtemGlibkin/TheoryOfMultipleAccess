function x = genMessageStream(lambda, t)
timebuf = 0;
i = 1;
x = zeros(1, t);
    while(1)
        tao = -1/lambda * log(rand());
        timebuf = timebuf + tao;
        if(timebuf <= 1)
            x(i) = x(i) + 1;
        else
            new = floor(timebuf);
            if((i+new) > t)
                break;
            end;
            i = i + new;
            x(i) = x(i) + 1;
            timebuf = timebuf - new;
        end;
    end;
