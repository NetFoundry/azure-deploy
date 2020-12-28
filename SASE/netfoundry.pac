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
if (host == "ws.http.ziti")
{
return 'DIRECT';
}
if (url.substring(0, 5) == 'http:')
{
return 'PROXY secure.internet.http:80';
}
if (url.substring(0, 6) == 'https:')
{
return 'PROXY secure.internet.https:443';
}
}
