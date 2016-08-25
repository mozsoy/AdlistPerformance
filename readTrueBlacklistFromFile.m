function cTrueBlacklistUrls = readTrueBlacklistFromFile(sFileName)
%READTRUEBLACKLISTFROMFILE Read true blacklisted urls from a text file and
%return the column cell array of urls in the text file.

%Open the file
nFileId = fopen(sFileName);

%Read the header of the file from the first line
fgetl(nFileId);

%Read the contents of the file
cTrueBlacklistUrls = textscan(nFileId,'%s','Delimiter',{'\n','^$third-party','||'});
cTrueBlacklistUrls = cTrueBlacklistUrls{1,1};

%Remove empty strings from cUrls
cTrueBlacklistUrls(strcmp('',cTrueBlacklistUrls)) = [];

%Close the file
fclose(nFileId);

end

