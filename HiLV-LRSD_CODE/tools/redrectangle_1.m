%% This code draws the detection frame of the target
function imrgb = redrectangle_1(im,x0,y0,color)
tnum = 1;
[by,bx] = size(im);
m = 0;
n = 0;
r1 = 15;
r2 = 15;
a = x0;
x0 = y0;
y0 = a;
for j = 1:tnum
    if(y0(j)<bx)&&(x0(j)<by)
        if color == 1
            % red
            r = 2*r1+m-1;
            im(max(x0(j)-r1,1),max(y0(j)-r1,1):max(y0(j)-r1,1)+r,1) = 255;
            im(max(x0(j)-r1,1),max(y0(j)-r1,1):max(y0(j)-r1,1)+r,2) = 0;
            im(max(x0(j)-r1,1),max(y0(j)-r1,1):max(y0(j)-r1,1)+r,3) = 0;
            im(max(x0(j)-r1,1):max(x0(j)-r1,1)+r,max(y0(j)-r1,1),1) = 255;
            im(max(x0(j)-r1,1):max(x0(j)-r1,1)+r,max(y0(j)-r1,1),2) = 0;
            im(max(x0(j)-r1,1):max(x0(j)-r1,1)+r,max(y0(j)-r1,1),3) = 0;
            im(max(x0(j)-r1,1):max(x0(j)-r1,1)+r,max(y0(j)-r1,1)+r,1) = 255;
            im(max(x0(j)-r1,1):max(x0(j)-r1,1)+r,max(y0(j)-r1,1)+r,2) = 0;
            im(max(x0(j)-r1,1):max(x0(j)-r1,1)+r,max(y0(j)-r1,1)+r,3) = 0;
            im(max(x0(j)-r1,1)+r,max(y0(j)-r1,1):max(y0(j)-r1,1)+r,1) = 255;
            im(max(x0(j)-r1,1)+r,max(y0(j)-r1,1):max(y0(j)-r1,1)+r,2) = 0;
            im(max(x0(j)-r1,1)+r,max(y0(j)-r1,1):max(y0(j)-r1,1)+r,3) = 0;
        end
        if color == 0
            % green
            r = 2*r2+n-1;
            im(max(x0(j)-r2,1),max(y0(j)-r2,1):max(y0(j)-r2,1)+r,1) = 0;
            im(max(x0(j)-r2,1),max(y0(j)-r2,1):max(y0(j)-r2,1)+r,2) = 255;
            im(max(x0(j)-r2,1),max(y0(j)-r2,1):max(y0(j)-r2,1)+r,3) = 0;
            im(max(x0(j)-r2,1):max(x0(j)-r2,1)+r,max(y0(j)-r2,1),1) = 0;
            im(max(x0(j)-r2,1):max(x0(j)-r2,1)+r,max(y0(j)-r2,1),2) = 255;
            im(max(x0(j)-r2,1):max(x0(j)-r2,1)+r,max(y0(j)-r2,1),3) = 0;
            im(max(x0(j)-r2,1):max(x0(j)-r2,1)+r,max(y0(j)-r2,1)+r,1) = 0;
            im(max(x0(j)-r2,1):max(x0(j)-r2,1)+r,max(y0(j)-r2,1)+r,2) = 255;
            im(max(x0(j)-r2,1):max(x0(j)-r2,1)+r,max(y0(j)-r2,1)+r,3) = 0;
            im(max(x0(j)-r2,1)+r,max(y0(j)-r2,1):max(y0(j)-r2,1)+r,1) = 0;
            im(max(x0(j)-r2,1)+r,max(y0(j)-r2,1):max(y0(j)-r2,1)+r,2) = 255;
            im(max(x0(j)-r2,1)+r,max(y0(j)-r2,1):max(y0(j)-r2,1)+r,3) = 0;
        end
    end
end
imrgb = im;

