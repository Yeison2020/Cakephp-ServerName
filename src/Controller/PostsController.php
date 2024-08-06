<?php
namespace App\Controller;

use App\Controller\AppController;
use Cake\Http\Client;

class PostsController extends AppController
{
    public function index()
    {
        $http = new Client();
        $response = $http->get('https://jsonplaceholder.typicode.com/posts');

        if ($response->isOk()) {
            $posts = $response->getJson();
            $this->set(compact('posts'));
        } else {
            $statusCode = $response->getStatusCode();
            $error = $response->getStringBody();
            $this->set(compact('statusCode', 'error'));
        }
    }
}
