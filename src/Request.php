<?php

namespace Basemkhirat\Elasticsearch;

use Symfony\Component\HttpFoundation\Request as SymfonyRequest;
/**
 * Class Request
 * @package Basemkhirat\Elasticsearch
 */
class Request extends SymfonyRequest
{
    /**
     * Get the request url
     * @return string
     */
    public static function url()
    {

        return rtrim(preg_replace('/\?.*/', '', $this->getUri()), '/');
    }

    /**
     * Get all query string parameters
     * @return mixed
     */
    public static function query()
    {
        return $_GET;
    }

    /**
     * Get value of query string parameter
     * @param $name
     * @param null $value
     * @return null
     */
    public static function get($name, $value = NULL)
    {
        return isset($_GET[$name]) ? $_GET[$name] : $value;
    }

}
