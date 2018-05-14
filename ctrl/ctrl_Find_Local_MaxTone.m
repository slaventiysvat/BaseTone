function  mass_max1 = ctrl_Find_Local_MaxTone(res_val)
%this function return local maximum for each array which she get
a=1;
while a<=length(res_val(:,1))
for i=2:1:length(res_val(a,:))-1
    f1=res_val(a,i-1);
    f2=res_val(a,i+1);
    diff_f(i)=(f2-f1)/((i+1)-(i-1));
    
end
% we find local variations of the function

    for  i=2:1:length(res_val(a,:))-2

       if diff_f(i-1) > 0 && diff_f(i+1) < 0 
           mass_check(i)=1;
       else
           mass_check(i)=0;
       end
       
       if  mass_check(i)==1
           mass_max(i)=res_val(a,i+1);
       else
           mass_max(i)=0;
       end
    end
    mass_max1(a,:)=mass_max;
%     f1=f(1:length(res_val(1,:))-2);
a=a+1;
end

