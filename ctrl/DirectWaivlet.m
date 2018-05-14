function Wave_Data_Output = DirectWaivlet(input_data,Wave_Data_Output)
% direct wavelet conversion
%Autor Starokoszev S.V. 26.02.18

%number of decomposed

% Wave_Data_Output= ctrl_size_weiv_array(input_data,Wave_Data_Output);

SYG=input_data.ArrayRezult;
N = input_data.ElemSize;
ThypeWeivlet=Wave_Data_Output.WaivletName;  
G = Wave_Data_Output.ComponentFiltWeiv;

[m n]=size(SYG);

if m>1 && n >1
    
    error('DirectWaivlet: input 1D array please');
end

if m>1
SYG = get_norm_vektor(SYG,N);
end

[Lo_D,Hi_D] = wfilters(ThypeWeivlet,'d');%filter for decomposition 
[C,L] = wavedec(SYG,G,Lo_D,Hi_D);
Wave_Data_Output.DirectWeivletArray = C;
Wave_Data_Output.LengthWeivleCompL=L;
statistic_out = ctrl_statistic(C,L,G);

end

