> 2021.08.18更新

certcheck.php

```php
<?php
// 代码来自：http://4563.org/?p=6029

//需要检查的域名数组
$domains = array(
	"only4.work",
	"reciteword.com",
	"tawords.com",
);

foreach($domains as $domain){
	$result = check($domain);
	echo $domain." \t\t ".$result."<br>";
}


//检测证书信息
function check($domain){
	$stream_option = array(
		"ssl" => array(
			"capture_peer_cert_chain" => true
		)
	);
	$stream = stream_context_create($stream_option); 
	$stream_client = stream_socket_client("ssl://".$domain.":443", $errno, $errstr, 20, STREAM_CLIENT_CONNECT, $stream);
	if(!$stream_client){
		return "发生错误，错误代码：".$errno;
	}
	$stream_info = stream_context_get_params($stream_client);
	stream_socket_shutdown($stream_client, STREAM_SHUT_WR);
	
	foreach ($stream_info["options"]["ssl"]["peer_certificate_chain"] as $cert) {
		$cerInfo = openssl_x509_parse($cert);
		if(strstr($cerInfo["extensions"]["subjectAltName"],"DNS:".$domain) != false){
			return expireLeft($cerInfo['validTo_time_t']);
			if($cerInfo['validTo_time_t'] - time() < 86400){
				sendFTQQ($domain);
			}
		}else{
			return "未发现该证书对应的域名：".$cerInfo["extensions"]["subjectAltName"];
		}
	}
}

//证书到期时间格式化
function expireLeft($exp_time){
	$sec = $exp_time - time();
	switch ($sec)
	{
		case $sec<0:
			return "已过期";
			break;  
		case $sec > 0 and $sec < 61:
			return $c."秒";
			break; 
		case $sec < 3600 and $sec > 60:
			return round($c/60,0)."分钟";
			break; 
		case $sec < 86401 and $sec > 3600:
			return round($c/3600,0)."小时";
			break; 
		case $sec > 86400:
			return floor($sec/86400)."天";
			break; 
	}
}

//方糖通知
//申请地址：http://sc.ftqq.com/3.version
function sendFTQQ($domain){
// 	$SCKEY = "方糖KEY";
// 	$url = 'https://sc.ftqq.com/'.$SCKEY.'.send?desp='.urlencode($domain).'&text='.urlencode("域名证书到期通知");
// 	$ch = curl_init();
// 	curl_setopt($ch, CURLOPT_URL, $url);
// 	curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
// 	curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
// 	curl_setopt($ch, CURLOPT_SSLVERSION , CURL_SSLVERSION_DEFAULT);
// 	curl_setopt($ch, CURLOPT_POST, TRUE);
// 	curl_setopt($ch, CURLOPT_POSTFIELDS, $data);        
// 	curl_setopt($ch, CURLOPT_TIMEOUT, 10);
// 	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
// 	$result = curl_exec($ch);
// 	curl_close($ch);
	return;
}
?>
```

