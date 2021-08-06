```php
<?php
class js{
    public static function to($url) {
        echo '<script>location.replace("?page={$url}");</script>';
    }
}
```