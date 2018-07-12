function  mass_max1 = ctrl_Find_Local_MaxTone(res_val)
%this function return local maximum for each array which she get
xd = diff(res_val);
xds = sign(xd);
% we find local variations of the function
ix = (xds(1:end-1)~=xds(2:end)); % all extrema
ix = ix & (xds(1:end-1)>0); % only maximums
mask(2:length(ix)+1) = ix;
ind = find(mask); 
A=zeros(1,length(res_val));
for a=1:1:length(ind)
    tmp=ind(a);
    for i=1:1:length(res_val)
        if i==tmp
            A(i)=res_val(i);
        end
    end
end
mass_max1=A;
%     for  i=2:1:length(res_val(a,:))-2
% 
%        if diff_f(i-1) > 0 && diff_f(i+1) < 0 
%            mass_check(i)=1;
%        else
%            mass_check(i)=0;
%        end
%        
%        if  mass_check(i)==1
%            mass_max(i)=res_val(a,i+1);
%        else
%            mass_max(i)=0;
%        end
%     end
%     mass_max1(a,:)=mass_max;
%     f1=f(1:length(res_val(1,:))-2);
end

