function  WaveName =  ToneDeNoise(input_data,NN,WaveName)

G=length(NN(1,:));
[C,L] = wavedec(input_data,G,WaveName);
prozent=NN(1,:);
Correction=NN(2,:);
NumbComponent = G;
OutputArray = C;
type=WaveName;
[Lo_R,Hi_R] = wfilters(type,'r');

           
         ArrayConvercion = ctrl_component_weiv(OutputArray,L,NumbComponent,prozent,Correction);
               
         ArrayConvercion = waverec(ArrayConvercion,L,Lo_R,Hi_R);
         
         WaveName = ArrayConvercion;

end








