```php
<?php
// 禁止本php文件被单独访问
if(basename($_SERVER['PHP_SELF']) == basename(__FILE__)) return;


// 该类中函数使用urldecode和urlencode对参数值进行编码、解码
class Url{
    /**
     * 将字符串参数变为数组
     * @param $query
     * @return array
     */
    public static function convertUrlQuery($query)
    {
      $queryParts = explode('&', $query);
      $params = array();
      foreach ($queryParts as $param) {
        $item = explode('=', $param);
        try {
            $params[$item[0]] = urldecode($item[1]);
        } catch (Exception $e) {
            return "";
        }
      }
      return $params;
    }
    
    /**
     * 将参数变为字符串
     * @param $array_query
     * @return string
     */
    public static function getUrlQuery($array_query)
    {
      $tmp = array();
      foreach($array_query as $k=>$param)
      {
        $tmp[] = $k.'='.urlencode($param);
      }
      $params = implode('&',$tmp);
      return $params;
    }
}
```