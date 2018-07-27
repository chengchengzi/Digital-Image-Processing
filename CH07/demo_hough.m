%使用霍夫变换做检测和连接

%%
%   霍夫变换
f = imread('Fig1006(a).tif');
[H,theta,rho] = hough(f,'ThetaResolution',0.2);
figure,imshow(H,[],'XData',theda,'YData',rho,'InitialMagnification','fit');
axis on,axis normal;
xlabel('\theta'),ylabel('\rho');

%%
%   寻找5个有意义的霍夫变换峰值
peaks = houghpeaks(H,5);
hold on;
plot(theta(peaks(:,2)),rho(peaks(:,1)),'linestyle','none','marker','s','color','w');

 %%
 %  寻找和连接线段
lines = houghlines(f,theta,rho,peaks);
figure,imshow(f),hold on;
for k = 1:length(lines)
    xy = [lines(k).point1 ; lines(k).point2];
    plot(xy(:,1),xy(:,2),'LineWidth',4,'Color',[.8 .8 .8]);
end