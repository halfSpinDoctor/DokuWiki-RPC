% SCRIPT DokuWiki_RPC
%
% Example script of DokuWiki remote procedure call
%
% Samuel A. Hurley
% 12 Apr 2017


% Setup DokuWiki Java Client
javaaddpath('dokujclient-3.8.0.jar');
javaaddpath('aXMLRPC-1.10.0.jar');
javaaddpath('jISO8601-0.2.jar');

import dw.xmlrpc.DokuJClient;
import dw.xmlrpc.Page;

url  = 'http://<URL>/<wiki-path>/lib/exe/xmlrpc.php';
user = '<username>';
pass = '<password>';

dokuClient = DokuJClient(url, user, pass);

% List ID of all pages
pages = dokuClient.getAllPages();

for ii = 1:size(pages)
  current_page = pages.get(ii-1);
  disp(current_page.id);
end

% Append text to a page:
text = char(dokuClient.getPage('test'));
text1 = sprintf([text 'New line!\n\n']);
dokuClient.putPage('test', text1);

% % Form XML query
% data = struct();
% data.methodCall.methodName = 'dokuwiki.login';
% 
% xmlData = struct2xml(data);
% 
% options  = weboptions('MediaType','application/xml');
% response = webwrite(url,xmlData,options)