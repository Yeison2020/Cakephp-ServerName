<?php
namespace App\Controller;

use App\Controller\AppController;

class OrderController extends AppController
{
    // public function helloWorld()
    // {
    //     $this->autoRender = false;
    //     echo 'Hello, World!';
    // }
    public function helloOrder()
    {
        // Disable auto-rendering of a view
        $this->autoRender = false;

        // Set the response body
        $this->response = $this->response->withStringBody('Hello, order!');

        // Return the response object to ensure the content is properly emitted
        return $this->response;
    }


}
