A = readmatrix('monte_carlo_source_data.csv'); %Source data file, the first column is age, the rest is the property of interest, which you could change accordingly.
iteration = 1000000; %Specify the # of Monte Carlo runs
histo = zeros(iteration,2);

for i=1:iteration
    inso = zeros(29,3);
    for j=1:29 %29 random samples
       age = 1200+ceil(rand*1200); %Define age range, here 1200 to 2400 ka
       inso(j,1) = A(age,2); %65 N Jun 21 insolation at this age
       inso(j,2) = A(age,3); %77 S Dec 21 insolation at this age
       inso(j,3) = A(age,4); %N.H. ISI where threshold t = 275 W m-2
    end
    histo(i,1) = corr(inso(:,1),inso(:,2)); %Calculated correlation coefficient
    histo(i,2) = corr(inso(:,2),inso(:,3)); %Calculated correlation coefficient
    disp(['Iteration',num2str(i),' finished!'])
end

histogram(histo(:,1))
writematrix(histo,'NvsS_monte_carlo_result.csv') %output files
