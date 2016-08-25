%Script to evaluate the performance of adlist application

%File that consist true blacklist urls
sFileName = 'blacklist.txt';
%True blacklist urls
cTrueBlacklistUrls = readTrueBlacklistFromFile(sFileName);
%Adlist blacklist urls
sUrl = 'http://adlist.herokuapp.com/urlpublish';
tAdlistUrls = getAdlistTable(sUrl);
%Read adlist urls from the table
cAdlistUrls = tAdlistUrls.Url;

%Intersect adlist urls with true blacklist urls
cTrueAdlistUrls = intersect(cTrueBlacklistUrls,cAdlistUrls);
nSizeTrueAdlistUrls = size(cTrueAdlistUrls,1);
%Intersect adlist urls with true blacklist keywords
cBlacklistKeywords = {'ad','slider','popup','click'};
for sBlacklistKeyword = cBlacklistKeywords
    for sAdlistUrl = cAdlistUrls'
       if ~isempty(findstr(sAdlistUrl{1,1},sBlacklistKeyword{1,1}))
           nSizeTrueAdlistUrls = nSizeTrueAdlistUrls + 1;
           cTrueAdlistUrls{nSizeTrueAdlistUrls,1} = sAdlistUrl;
       end
    end
end

%Adlist blacklist urls
sUrl = 'http://adlist.herokuapp.com/urlpublish/thresholded';
tAdlistUrls = getAdlistTable(sUrl);
%Read adlist urls from the table
cAdlistUrls = tAdlistUrls.Url;



