function  [acor,sizeStrob,sizeEndStrob,iterationStrob]=ctrl_autocorrHalfPower(WaveRes)
[acor,lag] = xcorr(WaveRes,WaveRes);%correlations
%here we consider power of signal
acorP=acor.^2;%power of  cor function
[maxP,centre] = max(acorP);
halfP=maxP/2;%find half power

[~, idxRight] = min(abs(acorP-halfP));%find index point where we have half power
% indHalfP = acorP(idxRight);
% [~,I] = max(abs(acor));
% lagDiff = lag(I);
% timeDiff = lagDiff/Fs;

idxLeft = 0;

        if idxRight > centre

                indLeft= centre -(idxRight - centre);
                pnew=acorP(indLeft:idxRight);


        else
                idxLeft=idxRight;
                idxRight = centre + (centre - idxLeft);
                pnew=acorP(idxLeft:idxRight);

        end

  sizeStrob=length(pnew);
  
if sizeStrob > length(WaveRes)
    
    sizeStrob = length(WaveRes);
    
end
    iterationStrob=fix(length(WaveRes)/length(pnew));
sizeEndStrob=length(WaveRes)-iterationStrob*sizeStrob;
 
%find local maximum
% startStrob=1;
% M=sizeStrob;
% i=1;
% arrFi=WaveRes(B,:);
end