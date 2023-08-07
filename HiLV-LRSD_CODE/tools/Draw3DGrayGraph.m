function [out] = Draw3DGrayGraph(img, isShowLine)
%������ά�Ҷ�ͼ
%   img:����ͼ��
%   isShowLine: �Ƿ���ʾ����
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