clc;
close all;
clear all;

% 设置颜色和偏振矩阵
color=[1,2,3;
       3,1,2;
       2,3,1];
pol=[1,3,2;
     3,2,1;
     2,1,3];

% 计算转换矩阵
M=transition_matrix(color,pol);
M=complex(fix(real(M).*(10^4))./(10^4),fix(imag(M).*(10^4))./(10^4));

% 循环处理40张图像
for image_id = 1:40
    fprintf('Processing image %d/40\n', image_id);
    
    % 创建输出目录
    output_dir = sprintf('NEW/%d', image_id);
    if ~exist(output_dir, 'dir')
        mkdir(output_dir);
    end
    
    % 获取Stokes参数
    [RS0,RS1,RS2,GS0,GS1,GS2,BS0,BS1,BS2]=Color_shift_conversion(image_id);
    
    % 计算频域分量
    f1=M(1,1)*RS0+M(1,2)*RS1+M(1,3)*RS2+M(1,4)*GS0+M(1,5)*GS1+M(1,6)*GS2+M(1,7)*BS0+M(1,8)*BS1+M(1,9)*BS2;
    f2=M(2,1)*RS0+M(2,2)*RS1+M(2,3)*RS2+M(2,4)*GS0+M(2,5)*GS1+M(2,6)*GS2+M(2,7)*BS0+M(2,8)*BS1+M(2,9)*BS2;
    i=3;
    f3=M(i,1)*RS0+M(i,2)*RS1+M(i,3)*RS2+M(i,4)*GS0+M(i,5)*GS1+M(i,6)*GS2+M(i,7)*BS0+M(i,8)*BS1+M(i,9)*BS2;
    i=4;
    f4=M(i,1)*RS0+M(i,2)*RS1+M(i,3)*RS2+M(i,4)*GS0+M(i,5)*GS1+M(i,6)*GS2+M(i,7)*BS0+M(i,8)*BS1+M(i,9)*BS2;
    i=i+1;
    f5=M(i,1)*RS0+M(i,2)*RS1+M(i,3)*RS2+M(i,4)*GS0+M(i,5)*GS1+M(i,6)*GS2+M(i,7)*BS0+M(i,8)*BS1+M(i,9)*BS2;
    i=i+1;
    f6=M(i,1)*RS0+M(i,2)*RS1+M(i,3)*RS2+M(i,4)*GS0+M(i,5)*GS1+M(i,6)*GS2+M(i,7)*BS0+M(i,8)*BS1+M(i,9)*BS2;
    i=i+1;
    f7=M(i,1)*RS0+M(i,2)*RS1+M(i,3)*RS2+M(i,4)*GS0+M(i,5)*GS1+M(i,6)*GS2+M(i,7)*BS0+M(i,8)*BS1+M(i,9)*BS2;
    i=i+1;
    f8=M(i,1)*RS0+M(i,2)*RS1+M(i,3)*RS2+M(i,4)*GS0+M(i,5)*GS1+M(i,6)*GS2+M(i,7)*BS0+M(i,8)*BS1+M(i,9)*BS2;
    i=i+1;
    f9=M(i,1)*RS0+M(i,2)*RS1+M(i,3)*RS2+M(i,4)*GS0+M(i,5)*GS1+M(i,6)*GS2+M(i,7)*BS0+M(i,8)*BS1+M(i,9)*BS2;
    
    % 频域位置调整
    [f2,f3,f4,f5,f6,f7,f8,f9]=Fre_domain_pos_adjust(BS0,f2,f3,f4,f5,f6,f7,f8,f9);
    
    % 保存频域数据
    fre_file = fullfile(output_dir, 'fre.mat');
    save(fre_file, 'f1','f2','f3','f4','f5','f6','f7','f8','f9');
    
    % 生成CFA图像
    CFA = create_CFA(f1,f4,f7,f2,f5,f8,f3,f6,f9);
    cfa_file = fullfile(output_dir, 'CFA.png');
    imwrite(CFA, cfa_file);
    
    fprintf('Saved CFA image to %s\n', cfa_file);
end

fprintf('All 40 images processed successfully!\n');





% CFA1 = fft2(f5);
% % CFA1=fftshift(CFA1);
% CFA1=abs(CFA1/256);
% figure(3);
% imshow(CFA1);
% 
% figure(1);
