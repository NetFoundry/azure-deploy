function FindProxyForURL(url, host)
{
/* Normalize the URL for pattern matching */
url = url.toLowerCase();
host = host.toLowerCase();
/* Don't proxy local hostnames */
if (isPlainHostName(host))
{
return 'DIRECT';
}
if (host == "100.25.68.105" || host == "13.93.117.39" || host == "20.185.40.104")
{
return 'DIRECT';
}
if (url.substring(0, 5) == 'http:')
{
return 'PROXY secure.internet.http:80';
}
if (url.substring(0, 6) == 'https:')
{
return 'PROXY secure.internet.http:443';
}