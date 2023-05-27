function FindProxyForURL(url, host) {
// This is a template PAC file for schools built by Lightspeed Systems
// Your proxy server name and port
var proxy_yes = "SOCKS 127.0.0.1:10808";
var proxy_no = "DIRECT";
// there two ways can not access raw.githubusercontent.com yet
// If the hostname matches, send to proxy.
// if (dnsDomainIs(host, "raw.githubusercontent.com")) {
//	return proxy_yes
// }
// if (dnsResolve(host) == "0.0.0.0") {
//	return proxy_yes
// }
// if (shExpMatch(host, "drive.google.com") || shExpMatch(host, "translate.google.com")) {
//		return proxy_yes
//	}
if (shExpMatch(host, "*.youdao.com") || shExpMatch(host, "*.u-tools.cn") || shExpMatch(url, "*.baidubce.com") || shExpMatch(host, "*.qq.com")) {
	return proxy_no;
	}
// DEFAULT RULE: All other traffic, send direct
return proxy_yes;
}
