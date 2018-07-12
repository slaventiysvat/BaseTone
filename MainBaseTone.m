clear
clc
%here we will find base tone in human voice, i hope
Path='/mnt/work/develop/matlab/stark/AudioFilter/AudioAnalizer/OriginalSignal/01-01-01-_AudioTrimmer_com_1_.wav';
Data=audioinfo(Path);
Fs=Data.SampleRate;
% sampleSize=1128;
sampleSize=2048;
inputSignal=audioread(Path);
a=1;
% inputSignal=inputSignal(30000:42550);
%===================== discrete fourier transform for each sample in audio signal
arrayOfPlots=[];
% load TestSignal2.mat
plot(inputSignal(97000:105097))
% sound(TestSignal2(97000:150097),Fs);
TestSignal2=inputSignal(97000:105097);
new_wector = get_norm_vektor(TestSignal2,sampleSize);%returns an array of multiples of "sampleSize"
%выделяем огибающую для определеня частоты основного тона
N = wmaxlev(sampleSize,'sym8');
NN=ctrl_Select_Level_And_Decom(N,[100 0 0 0 0 0 0]);%выделяю огибающие  
%  WaveName =  ToneDeNoise(input_data,NN,WaveName)
% ArrayConvercion = ctrl_Component_Weiv_Tone(OutputArray,L,NumbComponent,prozent,Correction)
% WaveRes= ToneDeNoise(new_wector,NN,'sym8');
res_val = ctrl_sigSectorWitoutFFT(new_wector,sampleSize);%return each plots size sampleSize

fc = 4000;
fs = 44100;
Rp=1;
Rs=60;
Wp=fc/(fs/2);
% [b,a] = butter(6,fc/(fs/2));
[b,a] = ellip(10,Rp,Rs,Wp);
freqz(b,a)
dataIn = abs(res_val(1,:));
for i=1:1:4
    dataIn(i,:) = abs(res_val(i,:));
    dataOut(i,:) = filter(b,a,dataIn(i,:));
end
% dataOut = filter(b,a,dataIn);
figure
plot(dataOut(1,:)./max(dataOut(1,:)))
hold on
plot(res_val(1,:)./max(res_val(1,:)))

%  =  ToneDeNoise(res_val,NN,'sym8');
% s1=xcorr(res_val(1,:),res_val(1,:));
% y = abs(hilbert(res_val(1,:)));
% figure
% plot(res_val(1,:))
% hold on
% y1=abs(fftshift(fft(res_val(1,:))));
% y1=abs(hilbert(res_val(4,:)));
% plot(y1)
% plot(y)




a=1;
% A1=zeros(188,1024);
while a<=length(res_val(:,1))
    
    WaveRes(a,:)= dataOut(a,:) ;
    [Acor,SizeStrob,SizeEndStrob,IterationStrob]=ctrl_autocorrHalfPower(WaveRes(a,:));%возвращаю корреляцию и размер строба

    acor(a,:)=Acor;
    sizeStrob(a,:)=SizeStrob;
    sizeEndStrob(a,:)=SizeEndStrob;
    iterationStrob(a,:)=IterationStrob;
    Wave = ctrl_Find_Local_MaxTone(WaveRes(a,:));%нахожу локальные максимумы
    A(a,:)=ctrl_findLokalMaxStrob(Wave,iterationStrob(a,:),sizeEndStrob(a,:),sizeStrob(a,:));%прохожу по максимумам стробом
    
   mean_res=0;
   a=a+1;
end
a=1;
figure
plot(WaveRes(1,:)./max(WaveRes(1,:)))
hold on
plot(res_val(1,:)./max(res_val(1,:)))
%находим расстояние между максимумами
%так как у нас все нули а де не нули то там максимумы идет более хитрим
%путем
A1 = A(2,:).';
x = A1(:).'; 
i=1;
counter=1;%если у нас есть максимум то счетчик сбрасивается в ноль,
% а если нет то мы в счетчик увеличивем пока не встретим след максимум
vector=1;
while i < length(x)

if x(i) > 0
    if counter ==0
        counter=1;
    end
        vector=[vector counter];
      vector1(i)=counter;
    counter=0;
else
    counter=counter+1;
end

i=i+1;
end

t=1/Fs;
% f=0:1/T:Fs;
T=vector(2:end).*t;
f=1./T;
vect_mea=mean(f);

numberPlot=4;
gui_outputRezult(numberPlot,res_val,A,vector1,new_wector)



