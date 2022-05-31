function type=classify(invector,normsize,numOfFeatures,minnum)
type=zeros(minnum,1);
outmatrix=0;
dir =char('down','up','okay','metal','point','stop','vulcan');
labelvect=zeros(numOfFeatures,1);% see which index is in which category
for n=1:numOfFeatures,
    filename= strcat(dir(n,:),'/','features.dat');
    trainingmatrix=csvread(filename);
    [x,y]=size(trainingmatrix);
    labelvect(n,1)=x;
    for i=1:x,
        outmatrix(end+1,:)=norm(trainingmatrix(i,:)-invector,normsize);
    end
end
[m g]=size(outmatrix)
outmatrix

indexvec=zeros(minnum,1);
outmatrix1=sort(outmatrix,'ascend')   % find the least norms
for j=1:minnum,
    for k=1:m,
        if outmatrix1(j,:)==outmatrix(k,:)
            indexvec(j,:)=k;
        end
    end
end
labelvect=cumsum(labelvect);
indexvec
labelvect

for q=1:minnum,
    for h=1:numOfFeatures,
        if h==1
            if indexvec(q,:)<=labelvect(1,:)
                disp(dir(1,:))
                type(q,:)=1;
            end
        else
            if  (indexvec(q,:)<=labelvect(h,:)) && (indexvec(q,:)>labelvect(h-1,:))
                 disp(dir(h,:))
                 type(q,:)=h;
                 
            end
        end
    end
end


end
