
function allArr = ctrl_findLokalMaxStrob(arrFi,iterationStrob,sizeEndStrob,sizeStrob)
startStrob=1;
M=sizeStrob;
i=1;
allArr=[];
while i<=iterationStrob
    
    if i==iterationStrob
        if length(allArr)==length(arrFi)
            break;
        end
             if sizeStrob > length(arrFi)
                sizeStrob = length(arrFi);
            end
        if sizeStrob==length(arrFi)
            endi=sizeStrob;
        elseif sizeStrob < length(arrFi)
            endi=(sizeStrob+sizeEndStrob)-1;
            if length(arrFi) < endi
                ost=endi-length(arrFi);
                endi=endi-ost;
            end
        end
%         endi=startStrob+sizeEndStrob;
        [maxA,IdxA]=max(arrFi(startStrob:endi));
         sizeArr=length(arrFi(startStrob:endi));
         newArr=zeros(1,sizeArr);
         newArr(IdxA)=maxA;
         allArr=[allArr   newArr];

        startStrob=startStrob+sizeEndStrob;
        break;
    end  
    
    [maxA,IdxA]=max(arrFi(startStrob:sizeStrob-1));
    sizeArr=length(arrFi(startStrob:sizeStrob-1));
    newArr=zeros(1,sizeArr);
    newArr(IdxA)=maxA;
    allArr=[allArr   newArr];
    
    
%    ArrA(IdxA)=maxA;
if startStrob==1
    startStrob=0;
end
startStrob=startStrob+M;
sizeStrob=sizeStrob+M;
i=i+1;
end

end