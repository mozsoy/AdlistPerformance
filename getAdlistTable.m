function tAdlistUrls = getAdlistTable(sUrl)
%GETADLISTTABLE Returns the table of blacklist urls judged
%by the adlist application with their frequencies.

%% Navigate to the webpage with url frequency table 
web(sUrl);
% give it time to load the page
pause(10)
%% Call the function to grab the data
getTableFromWeb;
%% Select the table 
pause(2)
cUrlFreq = getTableFromWeb(1);
tAdlistUrls = cell2table(cUrlFreq(2:end,:),'VariableNames',{'Url','Frequency','Timestamp'});

end

