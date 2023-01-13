<?php

namespace App\Controllers;

class User extends BaseController
{



    public function index()
    {
        if (in_groups('user')) {
            $data['title'] = 'Dashboard User';
            return view('User/dashboard', $data);
        } elseif (in_groups('admin')) {
            $data['title'] = 'Dashboard Admin';
            return view('Admin/dashboard', $data);
        } else {
            return view('deskapp/login');
        }
    }
    public function profile()
    {
        $data['title'] = 'Profile ';
        return view('profile', $data);
    }
}