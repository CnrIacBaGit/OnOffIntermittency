function prob = distribution_off_phases(X)

% Compute distribution of the off phases
% INPUT --> variable X

X_star = mean(X);
X2 = abs(X-X_star);
variable = X2;

threshold = mean(variable);

% Look for the off phases and their time intervals
index = find(abs(variable)<threshold);
max_dur = length(index);
cont = 1;
interval{cont} = [];
int = [];
for i = 1 : max_dur
    if i > max_dur
        break
    else
        m = length(interval{end});
        if  m> 0
            value = interval{end}(end);
            i = find(index == value)+1;
        end
    end
    if i > max_dur
        break
    end
    int = [index(i)];
    if i == 1 % If we are at the first step, we look at the next value
        if index(i+1) ~= index(i)+1
            interval{cont} = int;
        else index(i+1) == index(i)+1
            if length(interval{cont}) == 0
                interval{cont} = [int, index(i+1)];
            else
                interval{cont} = [interval{cont}, index(i+1)];
            end
        end
    elseif i == max_dur % If we are at the last step, we look at the previous value
        if index(i-1) ~= index(i)-1
            cont = cont+1;
            interval{cont} = int;
        else
            interval{cont} = [interval{cont}, index(i)];
        end
        break
    else
        if (index(i+1) ~= index(i)+1 && index(i-1) ~= index(i)-1)
            cont = cont+1;
            interval{cont} = int;
        elseif (index(i+1) == index(i)+1 && index(i-1) ~= index(i)-1)
            cont = cont+1;
            if cont > size(interval,2)
                int = [int, index(i+1)];
                interval{cont} = int;
            else
                interval{cont} = [interval{cont}, index(i+1)];
            end
        elseif index(i-1) == index(i)-1
            if cont > size(interval,2)
                int = [int, index(i)];
                interval{cont} = int;
            else
                interval{cont} = [interval{cont}, index(i)];
            end
        end 
    end
end

% For each interval, compute its length
num_int = size(interval,2);
for i = 1 : num_int
    l_int(i) = length(interval{i});
end

% Compute the probability of having an interval of legnth i 
prob = zeros(1,length(variable));
for i = 1 : max_dur
    trova = find(l_int==i);
    how_many = length(trova);
    prob(i) = how_many/num_int;
end