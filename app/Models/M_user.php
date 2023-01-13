<?php

namespace App\Models;

use CodeIgniter\Model;

class M_user extends Model
{
    protected $table      = 'users';
    protected $primaryKey = 'id';
    protected $useAutoIncrement = true;
    protected $allowedFields  = [
        'email', 'username', 'fullname', 'mobile', 'password_hash', 'reset_hash', 'reset_at', 'reset_expires', 'activate_hash',
        'status', 'status_message', 'active', 'force_pass_reset', 'permissions', 'deleted_at',
    ];
    protected $useTimestamps   = true;
    public function createUser($data)
    {
        return $this->db->table('users')->insert($data);
    }
}