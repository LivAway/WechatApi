<?php


function css()
{

    $html = '';
    foreach (func_get_args() as $filename) {
        if (!preg_match('/\.css$/', $filename)) {
            $filename .= '.css';
        }

        $public_dir = APP_ROOT . 'public';
        $composer_dir = realpath(__DIR__ . '/../../public');
        if (!file_exists($public_dir . $filename) && !file_exists($composer_dir . $filename)) {
            $uri = findMaxVersionFilename($filename);
        } else {
            $uri = $filename;
        }

        if ($uri) {
            $html .= '<link href="' . $uri . '" media="all" rel="stylesheet" />' . PHP_EOL;
        }
    }

    return $html;

}



function findMaxVersionFilename($filename)
{

    $cache_name = preg_replace('/\//', '_', $filename);
    $cache_filename = APP_ROOT . 'app/cache/version/' . $cache_name;
    if (file_exists($cache_filename)) {
        return file_get_contents($cache_filename);
    }

    $public_dir = APP_ROOT . 'public';
    $dir_length = strlen($public_dir);
    $result = array();
    searchFileNames($public_dir, $filename, $result);
    foreach ($result as $k => $full_filename) {
        $result[$k] = substr($full_filename, $dir_length);
    }

    $composer_dir = realpath(__DIR__ . '/../../public');
    $dir_length = strlen($composer_dir);
    $composer_result = array();
    searchFileNames($composer_dir, $filename, $composer_result);
    if (strpos($filename, 'min.') === false) {
        $new_filename = preg_replace_callback('/\.(css|js)$/', function ($match) {
            return '.min.' . $match[1];
        }, $filename);

        searchFileNames($composer_dir, $new_filename, $composer_result);
    }
    foreach ($composer_result as $k => $full_filename) {
        $result[] = substr($full_filename, $dir_length);
    }


    $uri = null;
    if (count(($result))) {
        natsort($result);
        $uri = array_pop($result);
    }

    if ($uri) {
        checkDirExists(APP_ROOT . 'app/cache/version/');
        file_put_contents($cache_filename, $uri);
    }
    return $uri;

}



function isMacOsx()
{

    return (isset($_SERVER['_system_type']) && strtolower($_SERVER["_system_type"]) == 'darwin') || strtolower(PHP_OS) == 'darwin';
}

/**
 * @param $filename
 */
function checkDirExists($filename)
{


    if (!file_exists($filename)) {
        mkdir($filename, 0777, true);
    }
    if (isMacOsx()) {
        chmod($filename, 0777);
    } else {
        chown($filename, 'nobody');
    }


}

function searchFileNames($dir, $search_filename, &$result)
{
    $iterator = opendir($dir);
    $len = strlen($search_filename);
    while (false != ($filename = readdir($iterator))) {
        if ('.' == $filename || '..' == $filename) {
            continue;
        }
        $full_filename = $dir . '/' . $filename;
        if (is_dir($full_filename)) {
            searchFileNames($full_filename, $search_filename, $result);
        } else {
            if (substr($full_filename, -$len) == $search_filename) {
                $result[] = $full_filename;
            }
        }

    }
    closedir($iterator);
}

function isBlank($object)
{
    if (is_null($object) || '' === $object || (is_array($object) && count($object) < 1)) {
        return true;
    }
    return empty($object);
}