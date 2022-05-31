function [ counter, dividedData ] = divideIntoBins(theta, r, interval)
% Divide into Bins
% interval: radian specified to divide the polar coordinated image
%           needs to be divisible by 2pi
% theta: angles for each dot with respect to centroid, column vector
% r: distance of each dot with respect to centroid, column vector
  bins = -pi:interval:pi;
  % now we need a counter for each bin, 1xlength(bins)
  % and a container for the different r in the bin
  counter = zeros(1,2*pi/interval);
  dividedData = zeros(40,2*pi/interval); % each column represent a bin
  
  len = size(theta);
  for n = 1:len(1), % for every dot's angle
    for k = 1:length(bins)-1 % look through the bins and process it. 
      if(bins(k) <= theta(n) && theta(n) < bins(k+1))
        counter(k) = counter(k) + 1; % increment the counter in that bin
        dividedData(counter(k),k) = r(n); % store the length of the dot in the column
        break;
      end
    end
  end

end

