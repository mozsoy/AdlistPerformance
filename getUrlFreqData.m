%% Get url freq data from an HTML table straight into MATLAB
% Author: Metehan Ozsoy

%% Navigate to the webpage with url frequency table 
web('http://adlist.herokuapp.com/urlpublish/thresholded');
% give it time to load the page
pause(10)
%% Call the function to grab the data
getTableFromWeb;
%% Select the table 
pause(2)
cUrlFreq = getTableFromWeb(1);
tUrlFreq = cell2table(cUrlFreq(2:end,:),'VariableNames',{'Url','Frequency','Timestamp'});
%% Blacklist urls by searching for 'easylist' keywords like 'ad' or 'ads'
% Boolean array that indicates blacklist url rows in tUrlFreq table
bBlacklistUrlRows = ~cellfun(@isempty,regexp(tUrlFreq.Url,'ad'));
vBlacklistUrlRows = find(bBlacklistUrlRows);
vWhitelistUrlRows = find(~bBlacklistUrlRows);
% Get blacklist urls frequency table
tBlacklistUrlFreq = tUrlFreq(vBlacklistUrlRows,:);
tWhitelistUrlFreq = tUrlFreq(vWhitelistUrlRows,:);

%% Plot table data
figure;
x = 1:size(tUrlFreq,1);
y = cellfun(@str2num,tUrlFreq.Frequency);
plot(x,y);
title('Url Frequency');
xlabel('Url');
ylabel('Frequency');


