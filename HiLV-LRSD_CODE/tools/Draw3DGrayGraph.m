function [out] = Draw3DGrayGraph(img, isShowLine)
%绘制三维灰度图
%   img:输入图像
%   isShowLine: 是否显示网格
    if (size(img, 3) > 1)
        img = rgb2gray(img);
    end
    [y, x] = size(img);
    [X, Y] = meshgrid(1:x, 1:y);
    surf(X, Y, img);
%     title('3D gray distribution of the whole image')
    if ~isShowLine
        shading interp;
    end
    out = 0;
end