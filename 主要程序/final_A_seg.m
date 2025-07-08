clc; clear all; close all;
load fre21;
load fre22;
load fre23;
load fre24;
load fre25;
load fre26;
load fre27;
load fre28;
load fre29;
load fre210;
load fre211;
A=[A1;A2;A3;A4;A5;A6;A7;A8;A9;A10;A11];
% n=[];
% for i=1:1073298
%  n=[n;i]; 
%  i
% end
save('ZA','A');

load jishu;
load ZA;
% n(1073298,1)=[];
% n(1073297,1)=[];
nn=n(1:1073296,1);


nz=reshape(nn,1036,1036);
ndui=nz(7:1030,7:1030);
npl=reshape(ndui,1048576,1);


% 1-100000/1048576
aaa1=[];
for i=1:100000
    a=npl(i);
    aaa1=[aaa1;A(a,:)];
    i
end
save('AFIN1','aaa1');
clear aaa1;


% 1-200000/1048576
aaa2=[];
for i=100001:200000
    a=npl(i);
    aaa2=[aaa2;A(a,:)];
    i-100000
end
save('AFIN2','aaa2');
clear aaa2;



% 200001-300000/1048576
aaa3=[];
for i=200001:300000
    a=npl(i);
    aaa3=[aaa3;A(a,:)];
    i-200000
end
save('AFIN3','aaa3');
clear aaa3;


% 300001-400000/1048576
aaa4=[];
for i=300001:400000
    a=npl(i);
    aaa4=[aaa4;A(a,:)];
    i-300000
end
save('AFIN4','aaa4');
clear aaa4;




% 400001-500000/1048576
aaa5=[];
for i=400001:500000
    a=npl(i);
    aaa5=[aaa5;A(a,:)];
    i-400000
end
save('AFIN5','aaa5');
clear aaa5;



% 500001-600000/1048576
aaa6=[];
for i=500001:600000
    a=npl(i);
    aaa6=[aaa6;A(a,:)];
    i-500000
end
save('AFIN6','aaa6');
clear aaa6;


% 600001-700000/1048576
aaa7=[];
for i=600001:700000
    a=npl(i);
    aaa7=[aaa7;A(a,:)];
    i-600000
end
save('AFIN7','aaa7');
clear aaa7;



% 700001-800000/1048576
aaa8=[];
for i=700001:800000
    a=npl(i);
    aaa8=[aaa8;A(a,:)];
    i-700000
end
save('AFIN8','aaa8');
clear aaa8;







% 800001-900000/1048576
aaa9=[];
for i=800001:900000
    a=npl(i);
    aaa9=[aaa9;A(a,:)];
    i-800000
end
save('AFIN9','aaa9');
clear aaa9;



% % 900001-1000000/1048576
aaa10=[];
for i=900001:1000000
    a=npl(i);
    aaa10=[aaa10;A(a,:)];
    i-900000
end
save('AFIN10','aaa10');
clear aaa10;



% 1000001-1100000/1048576
aaa11=[];
for i=1000001:1048576
    a=npl(i);
    aaa11=[aaa11;A(a,:)];
    i-1000000
end
save('AFIN11','aaa11');
clear aaa11;


