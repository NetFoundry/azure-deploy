function FindProxyForURL(url, host)
{
/* Normalize the URL for pattern matching */
url = url.toLowerCase();
host = host.toLowerCase();
/* Don't proxy local hostnames */
// if (isPlainHostName(host))
// {
// return 'DIRECT';
// }
if (isPlainHostName(host) ||
    isInNet(host, "10.0.0.0", "255.0.0.0") ||
    isInNet(host, "192.168.0.0", "255.255.0.0") ||
    isInNet(host, "172.33.253.0", "255.255.255.0")
    )
{
return 'DIRECT';
}
if (host == "ws.ziti.http" || host == ".nfconsole.io")
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
