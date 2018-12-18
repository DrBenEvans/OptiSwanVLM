for i=1:NoGen
    F2(:,i)=cell2mat(F(i,1));
    p2(:,:)=cell2mat(p(i,1));
    [F_min(i) num_best(i)] = min(F2(:,i));
    p_best(i,:)=p2(num_best(i),:);
end

figure(1) 
plot(F_min,'-s')
xlabel('Number of Generation','FontWeight','bold','FontSize',16);
ylabel('Fitness Function Value (-L/D)','FontWeight','bold','FontSize',16);

figure(2) 
plot(F2(1:2,:)','-s')
xlabel('Number of Generation','FontWeight','bold','FontSize',16);
ylabel('Fitness Function Value (-L/D)','FontWeight','bold','FontSize',16);

[a b] = size(p_best)
for i=1:b
figure(3)
subplot(3,3,i)
plot(p_best(:,i),'-s')
xlabel('Number of Generation','FontWeight','bold','FontSize',12);
name=strcat('Design parameter',num2str(i));
ylabel(name,'FontWeight','bold','FontSize',12);
end