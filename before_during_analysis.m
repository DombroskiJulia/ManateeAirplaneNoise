%% Obtaining before and during exposure behavioural data
%Getting time cues from table with exposure cues (in samples) 
VI_sample=table2array(readtable('tm17_010a_airplane_samples.txt')); %reading in table with time of exposures in samples. 
fs=5; %frequency sampling of acc data (Hz/s)
atime=40; %analysis segment duration in seconds 
stime=VI_sample-(fs*atime);
etime=VI_sample+(fs*atime);
timecues=[stime etime];

%Obtaning vedba for intervals 40 s intervals  
for n=1:length(timecues)
OB{n}=tm17_010a_vedba(timecues(n,1): timecues(n,2));
end

%Transforming structure into matrix
for w=1:length(timecues)
Vi_VeDBA(:,w)=OB{1,w}; 
end 

%Getting mean before and after and difference 
before=mean(Vi_VeDBA(1:(fs*atime),:));
after=mean(Vi_VeDBA((fs*atime):((fs*atime)*2),:));
dif_exp_vedba=after-before;

%