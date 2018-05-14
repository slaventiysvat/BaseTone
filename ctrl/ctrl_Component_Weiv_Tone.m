function  ArrayConvercion = ctrl_Component_Weiv_Tone(OutputArray,L,NumbComponent,prozent,Correction)
output_weiv_comp_mass=zeros(1,NumbComponent);
input_size_weiv_mass=zeros(1,NumbComponent);
for i=1:1:NumbComponent
input_size_weiv_mass(i)=input_size_weiv_mass(i)+i;
end

output_weiv_comp_mass = detcoef(OutputArray,L,input_size_weiv_mass); 

% ArrayConvercion = OutputArray;

 Correction = Correction(length(Correction):-1:1);
  prozent = prozent(length(prozent):-1:1);

        for N=1:1:NumbComponent
                cd_N = output_weiv_comp_mass{1,N};
                
                     if prozent(N) == 100 &&  Correction(N) == 1
                       
              
                        output_weiv_comp_mass{1,N} = cd_N;
                        
                     end
                     
                    if Correction(N) > 0 && prozent(N) < 100
                        coef=GetCoefWeivlet(cd_N );
                        cd_N =cd_N .*(coef*prozent(N));
                        output_weiv_comp_mass{1,N} = cd_N;
                    end
                    if  Correction(N) == 0
                        
                        cd_N = cd_N *0;
                        output_weiv_comp_mass{1,N} = cd_N;
                        
                    end
                    
%                      output_weiv_comp_mass{1,N} = cd_N;
                     
                  
        end
        
         x=OutputArray(1:length(output_weiv_comp_mass{1,NumbComponent}));

         ArrayConvercion= x;
        
        for N=NumbComponent:(-1):1
        
             comp_arr=output_weiv_comp_mass{1,N};

             ArrayConvercion=[ArrayConvercion comp_arr];

        end
        
%          ArrayConvercion = waverec(ArrayConvercion,L,Lo_R,Hi_R);
end