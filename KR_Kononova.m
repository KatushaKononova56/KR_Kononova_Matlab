clc;
close all;
clear variables;
close all force;

% создаем новую фигуру и читаем первый файл
f = figure('Name', 'Иследования датчика температуры MCP9700');
DATA_mcp9700 = fileread('one_temp.log');
[n,siz]=size(DATA_mcp9700);
a=zeros(1,siz/6);
for i=1:1:siz/6
    b(1)=str2num(DATA_mcp9700(1,1+(i-1)*6))*10^5;
    b(2)=str2num(DATA_mcp9700(1,2+(i-1)*6))*10^4;
    b(3)=str2num(DATA_mcp9700(1,3+(i-1)*6))*10^3;
    b(4)=str2num(DATA_mcp9700(1,4+(i-1)*6))*10^2;
    b(5)=str2num(DATA_mcp9700(1,5+(i-1)*6))*10;
    b(6)=str2num(DATA_mcp9700(1,6+(i-1)*6));
    for j=1:1:6
        a(1,i)=a(1,i)+b(j);
    end
end
temp = a/1000;%так как температура передается сначала целая, потом дробная, то делим на 1000
sr_zn = num2str(mean(temp)); % переводим в строку среднее значение
max_temp = num2str(max(temp));% максимальное значение
min_temp =num2str(min(temp)); % минимальное значение
[n1, n2] = size(temp);
x=linspace(0,2.9,n2);
plot(x,temp);
grid on;
title('Зависимость температуры от времени для одного значения температуры', 'fontsize', 10);
xlabel('t,s'); 
ylabel('T, C^o');
text(0.1,26.38,'\slМаксимум равен ','Color','blue','FontSize',10);
text(0.1,26.27,'\slМинимум равен ','Color','blue','FontSize',10);
text(0.1,26.18,'\slСр.знач. равно ','Color','blue','FontSize',10);
text(1.25,26.38,max_temp,'Color','blue','FontSize',10);
text(1.25,26.27,min_temp,'Color','blue','FontSize',10);
text(1.25,26.18,sr_zn,'Color','blue','FontSize',10);
saveas(f,'MCP9700.png');%сохраняем график в формате png


% создаем новую фигуру и читаем первый файл
f0 = figure('Name', 'Иследования датчика температуры MCP9700');
DATA_mcp9700 = fileread('21.log');
[n,siz]=size(DATA_mcp9700);
a=zeros(1,siz/6);
for i=1:1:siz/6
    b(1)=str2num(DATA_mcp9700(1,1+(i-1)*6))*10^5;
    b(2)=str2num(DATA_mcp9700(1,2+(i-1)*6))*10^4;
    b(3)=str2num(DATA_mcp9700(1,3+(i-1)*6))*10^3;
    b(4)=str2num(DATA_mcp9700(1,4+(i-1)*6))*10^2;
    b(5)=str2num(DATA_mcp9700(1,5+(i-1)*6))*10;
    b(6)=str2num(DATA_mcp9700(1,6+(i-1)*6));
    for j=1:1:6
        a(1,i)=a(1,i)+b(j);
    end
    if a(1,i)/1000<18
        str = i
    end
end
temp = a/1000;%так как температура передается сначала целая, потом дробная, то делим на 1000
sr_zn = num2str(mean(temp)); % переводим в строку среднее значение
max_temp = num2str(max(temp));% максимальное значение
min_temp =num2str(min(temp)); % минимальное значение
[n1, n2] = size(temp);
x=linspace(0,9,n2);
plot(x,temp);
grid on;
title('Зависимость температуры от времени', 'fontsize', 10);
xlabel('t,s'); 
ylabel('T, C^o');
saveas(f0,'MCP9700_diftemp.png');%сохраняем график в формате png



%открываем новую фигуру и открывем сразу 2 файла, расстояние без
%температуры и с температурой
f1 = figure('Name', 'Иследование зависимости расстояния от температуры,Т=25\circС');
DATA_25_1 = fileread('dist_25_temp.log'); % с учетом температуры
[n1,siz1]=size(DATA_25_1);
a=zeros(1,siz1/6);
for i=1:1:siz1/6
    b(1)=str2num(DATA_25_1(1,1+(i-1)*6))*10^2;
    b(2)=str2num(DATA_25_1(1,2+(i-1)*6))*10;
    b(3)=str2num(DATA_25_1(1,3+(i-1)*6));
    b(4)=str2num(DATA_25_1(1,4+(i-1)*6))*10^2;
    b(5)=str2num(DATA_25_1(1,5+(i-1)*6))*10;
    b(6)=str2num(DATA_25_1(1,6+(i-1)*6));
    for j=1:1:3
        a(1,i)=a(1,i)+b(j);
    end
    a(1,i) = bitshift(a(1,i),8); %битовый сдвиг на 8, так как передаются сначала старшие биты, потом младшие
    for j=4:1:6
        a(1,i)=a(1,i)+b(j);
    end
    
end
temp25 = a;
DATA_25_2 = fileread('dist_25_no_temp.log');
[n2,siz2]=size(DATA_25_2);
a=zeros(1,siz2/6);
for i=1:1:siz2/6
    b(1)=str2num(DATA_25_2(1,1+(i-1)*6))*10^5;
    b(2)=str2num(DATA_25_2(1,2+(i-1)*6))*10^4;
    b(3)=str2num(DATA_25_2(1,3+(i-1)*6))*10^3;
    b(4)=str2num(DATA_25_2(1,4+(i-1)*6))*10^2;
    b(5)=str2num(DATA_25_2(1,5+(i-1)*6))*10;
    b(6)=str2num(DATA_25_2(1,6+(i-1)*6));
    for j=1:1:3
        a(1,i)=a(1,i)+b(j);
    end
    a(1,i) = bitshift(a(1,i),8); %битовый сдвиг на 8
    for j=4:1:6
        a(1,i)=a(1,i)+b(j);
    end
    
end
dis_without_temp = a;
[n1, n2] = size(temp25);
x1=linspace(0,2.9,n2);
[n3, n4] = size(dis_without_temp);
x2=linspace(0,2.9,n4);
sr_zn25 = [mean(temp25) mean(temp25)];
sr_zn =[mean(dis_without_temp) mean(dis_without_temp)];
x3 = [0 2.9];
plot(x1,temp25,x2,dis_without_temp);
hold on;
plot(x3,sr_zn25,'--');
plot(x3,sr_zn,'--');
hold off;
grid on;
legend('S','S(T)','Среднее значение', 'Среднее значение');
title('Зависимость расстояния от времени,Т=25\circС', 'fontsize', 10);
ylim([29 36]);
xlabel('t,s'); 
ylabel('S, cm');
t=['Разница значений от ', num2str(min(temp25) - max(dis_without_temp)),' до ', num2str(max(temp25) - min(dis_without_temp)), ' см'];
t=join(t,1);
text(0.3,30,t, 'Color','blue','FontSize',14);
saveas(f1,'dis_temp_25.png');%сохраняем график в формате png


f2 = figure('Name', 'Иследование зависимости расстояния от температуры,Т=0\circС');
DATA_25_1 = fileread('one_dist_0.log'); % с учетом температуры
[n1,siz1]=size(DATA_25_1);
a=zeros(1,siz1/6);
for i=1:1:siz1/6
    b(1)=str2num(DATA_25_1(1,1+(i-1)*6))*10^2;
    b(2)=str2num(DATA_25_1(1,2+(i-1)*6))*10;
    b(3)=str2num(DATA_25_1(1,3+(i-1)*6));
    b(4)=str2num(DATA_25_1(1,4+(i-1)*6))*10^2;
    b(5)=str2num(DATA_25_1(1,5+(i-1)*6))*10;
    b(6)=str2num(DATA_25_1(1,6+(i-1)*6));
    for j=1:1:3
        a(1,i)=a(1,i)+b(j);
    end
    a(1,i) = bitshift(a(1,i),8); %битовый сдвиг на 8
    for j=4:1:6
        a(1,i)=a(1,i)+b(j);
    end
    
end
temp25 = a;
DATA_25_2 = fileread('one_dist_0no_temp.log');
[n2,siz2]=size(DATA_25_2);
a=zeros(1,siz2/6);
for i=1:1:siz2/6
    b(1)=str2num(DATA_25_2(1,1+(i-1)*6))*10^5;
    b(2)=str2num(DATA_25_2(1,2+(i-1)*6))*10^4;
    b(3)=str2num(DATA_25_2(1,3+(i-1)*6))*10^3;
    b(4)=str2num(DATA_25_2(1,4+(i-1)*6))*10^2;
    b(5)=str2num(DATA_25_2(1,5+(i-1)*6))*10;
    b(6)=str2num(DATA_25_2(1,6+(i-1)*6));
    for j=1:1:3
        a(1,i)=a(1,i)+b(j);
    end
    a(1,i) = bitshift(a(1,i),8); %битовый сдвиг на 8
    for j=4:1:6
        a(1,i)=a(1,i)+b(j);
    end
    
end
dis_without_temp = a;
[n1, n2] = size(temp25);
x1=linspace(0,2.9,n2);
[n3, n4] = size(dis_without_temp);
x2=linspace(0,2.9,n4);
sr_zn25 = [mean(temp25) mean(temp25)];
sr_zn =[mean(dis_without_temp) mean(dis_without_temp)];
x3 = [0 2.9];
plot(x1,temp25,x2,dis_without_temp);
hold on;
plot(x3,sr_zn25,'--');
plot(x3,sr_zn,'--');
hold off;
grid on;
legend('S','S(T)','Среднее значение','Среднее значение');
title('Зависимость расстояния от времени,Т=0\circС', 'fontsize', 10);
ylim([58 67]);
xlabel('t,s'); 
ylabel('S, cm');
t=['Разница значений от 0 до ', num2str(max(temp25) - min(dis_without_temp)), ' см'];
t=join(t,1);
text(0.3,60,t, 'Color','blue','FontSize',14);
saveas(f2,'dis_temp_0.png');%сохраняем график в формате png



f3 = figure('Name', 'Иследование зависимости расстояния от температуры,Т=-10\circС');
DATA_25_1 = fileread('dist_m10_temp.log'); % с учетом температуры
[n1,siz1]=size(DATA_25_1);
a=zeros(1,siz1/6);
for i=1:1:siz1/6
    b(1)=str2num(DATA_25_1(1,1+(i-1)*6))*10^2;
    b(2)=str2num(DATA_25_1(1,2+(i-1)*6))*10;
    b(3)=str2num(DATA_25_1(1,3+(i-1)*6));
    b(4)=str2num(DATA_25_1(1,4+(i-1)*6))*10^2;
    b(5)=str2num(DATA_25_1(1,5+(i-1)*6))*10;
    b(6)=str2num(DATA_25_1(1,6+(i-1)*6));
    for j=1:1:3
        a(1,i)=a(1,i)+b(j);
    end
    a(1,i) = bitshift(a(1,i),8); %битовый сдвиг на 8
    for j=4:1:6
        a(1,i)=a(1,i)+b(j);
    end
    
end
temp25 = a;
DATA_25_2 = fileread('dist_m10_no_temp.log');
[n2,siz2]=size(DATA_25_2);
a=zeros(1,siz2/6);
for i=1:1:siz2/6
    b(1)=str2num(DATA_25_2(1,1+(i-1)*6))*10^5;
    b(2)=str2num(DATA_25_2(1,2+(i-1)*6))*10^4;
    b(3)=str2num(DATA_25_2(1,3+(i-1)*6))*10^3;
    b(4)=str2num(DATA_25_2(1,4+(i-1)*6))*10^2;
    b(5)=str2num(DATA_25_2(1,5+(i-1)*6))*10;
    b(6)=str2num(DATA_25_2(1,6+(i-1)*6));
    for j=1:1:3
        a(1,i)=a(1,i)+b(j);
    end
    a(1,i) = bitshift(a(1,i),8); %битовый сдвиг на 8
    for j=4:1:6
        a(1,i)=a(1,i)+b(j);
    end
    
end
dis_without_temp = a;
[n1, n2] = size(temp25);
x1=linspace(0,2.9,n2);
[n3, n4] = size(dis_without_temp);
x2=linspace(0,2.9,n4);
sr_zn25 = [mean(temp25) mean(temp25)];
sr_zn =[mean(dis_without_temp) mean(dis_without_temp)];
x3 = [0 2.9];
plot(x1,temp25,x2,dis_without_temp);
hold on;
plot(x3,sr_zn25,'--');
plot(x3,sr_zn,'--');
hold off;
grid on;
legend('S(Т)','S','Среднее значение','Среднее значение');
title('Зависимость расстояния от времени,Т=-10\circС', 'fontsize', 10);
ylim([24 32]);
xlabel('t,s'); 
ylabel('S, cm');
t=['Разница значений от ', num2str(min(dis_without_temp) - max(temp25)),' до ', num2str(max(dis_without_temp) - min(temp25)), ' см'];
t=join(t,1);
text(0.3,26,t, 'Color','blue','FontSize',14);
saveas(f3,'dis_temp_minus10.png');%сохраняем график в формате png



f4 = figure('Name', 'Исследование на точность');
DATA_25_1 = fileread('one_dist.log'); % с учетом температуры
[n1,siz1]=size(DATA_25_1);
a=zeros(1,siz1/6);
for i=1:1:siz1/6
    b(1)=str2num(DATA_25_1(1,1+(i-1)*6))*10^4;
    b(2)=str2num(DATA_25_1(1,2+(i-1)*6))*10^3;
    b(3)=str2num(DATA_25_1(1,3+(i-1)*6))*10^2;
    b(4)=str2num(DATA_25_1(1,4+(i-1)*6))*10^2;
    b(5)=str2num(DATA_25_1(1,5+(i-1)*6))*10;
    b(6)=str2num(DATA_25_1(1,6+(i-1)*6));
    for j=1:1:6
        a(1,i)=a(1,i)+b(j);
    end
    
end
dist = a/100;
[n1, n2] = size(dist);
x1=linspace(0,4.8,n2);
sr_zn = [mean(dist) mean(dist)];
x3 = [0 4.8];
plot(x1,dist);
hold on;
plot(x3,sr_zn,'--');
hold off;
grid on;
legend('S','Среднее значение');
title('Показания датчика для одного и того же расстояния', 'fontsize', 10);
xlabel('t,s'); 
ylabel('S, cm');
t=['Разница между максимальным и минимальным значением ', num2str(max(dist) - min(dist))];
t=join(t,1);
text(0.3,54.41,t, 'Color','blue','FontSize',10);
saveas(f4,'one_dist.png');%сохраняем график в формате png


f5 = figure('Name', 'Прогулка по квартире');
DATA_25_1 = fileread('HC_SR04.log'); % с учетом температуры
[n1,siz1]=size(DATA_25_1);
a=zeros(1,siz1/6);
for i=1:1:siz1/6
    b(1)=str2num(DATA_25_1(1,1+(i-1)*6))*10^5;
    b(2)=str2num(DATA_25_1(1,2+(i-1)*6))*10^4;
    b(3)=str2num(DATA_25_1(1,3+(i-1)*6))*10^3;
    b(4)=str2num(DATA_25_1(1,4+(i-1)*6))*10^2;
    b(5)=str2num(DATA_25_1(1,5+(i-1)*6))*10;
    b(6)=str2num(DATA_25_1(1,6+(i-1)*6));
    for j=1:1:6
        a(1,i)=a(1,i)+b(j);
    end
    
end
dist = a/1000;
[n1, n2] = size(dist);
x1=linspace(0,20,n2);
plot(x1,dist);
grid on;
legend('S');
title('Показания датчика для реальной прогулки', 'fontsize', 10);
xlabel('t,s'); 
ylabel('S, cm');
saveas(f5,'Walk.png');%сохраняем график в формате png