function gui_outputRezult(numberPlot,WaveRes,A,vector,new_wector)
figure
plot(WaveRes(numberPlot,:));
hold on
plot(A(numberPlot,:));
title(['plot of signal#=',num2str(numberPlot)])
legend('signal','envelope of signal')
hold off
figure
vector=[vector zeros(1,length(new_wector)-length(vector))];
vector=vector/max(vector);
plot(vector);
hold on
plot(new_wector./max(new_wector))
xlabel('counter = length between MAX');
ylabel('value length');
legend('length between max','inputSignal')
end