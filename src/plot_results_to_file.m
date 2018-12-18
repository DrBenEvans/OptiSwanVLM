function [] = plot_results_to_file(mesh,res,filename,titleStr)
%PLOT_RESULTS Summary of this function goes here
%   Detailed explanation goes here

clf('reset')
set(gcf,'Renderer','zbuffer')
set(gcf,'Visible','off');

colormap(jet)
trisurf(mesh.connec(:,1:3),mesh.xy(:,1),mesh.xy(:,2),res(:,1),'linestyle','none')
shading interp;
set(gca,'DataAspectRatio',[1 1 1],'Xlim',[-3 2],'Ylim',[-2 2])
daspect([1 1 1])
view(2)
title(titleStr)

print('-dpng',filename)

end

