function res_val = ctrl_sigSectorWitoutFFT(inputSignal,sampleSize)
startSemple=1;
endSemple=sampleSize;
arrayOfPlots=[];
new_wector = get_norm_vektor(inputSignal,sampleSize);%returns an array of multiples of "sampleSize"
lenghtSig=length(new_wector);
endIterator = lenghtSig/(sampleSize/2);
% proz=[15 25 35 45 55 65 75 85 95 100];
% otchet=proz.*512/100;
% otchet=[];
%25%=128
%50%=256
%75%=384
degreeOfOverlap=0;%50 - % overlap factor for sample/overlap between two adjacent(neighboring) samples
a=1;
 if a==1
        
        arrayOfPlots(a,:)=new_wector(startSemple:endSemple);
        startSemple  = 0;
 end
 res_val=zeros(endIterator,sampleSize,'double');
res_val= arrayOfPlots;
while a <= endIterator
    
    if endSemple==lenghtSig
        startSemple=startSemple-degreeOfOverlap;
        endSemple=endSemple-degreeOfOverlap;
        arrayOfPlots(a,:)=new_wector(startSemple:endSemple-1);
        res_val(a,:)=arrayOfPlots(a,:);
        
        break;
        
    end
    
    if a > 1

        startSemple=startSemple-degreeOfOverlap;
        endSemple=endSemple-degreeOfOverlap;
        arrayOfPlots(a,:)=new_wector(startSemple:endSemple-1);
        res_val(a,:)=arrayOfPlots(a,:);
        
    end
    
    if startSemple==1
        startSemple=0;
    end
    
    startSemple = startSemple + sampleSize;
    
    endSemple = endSemple + sampleSize;
    
    a=a+1;
    
end