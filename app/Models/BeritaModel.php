<?php

namespace App\Models;

use CodeIgniter\Database\BaseBuilder;

class BeritaModel
{
    protected $db;

    public function __construct()
    {
        $this->db = db_connect();
    }

    public function getBerita()
    {
        $builder = $this->db->table('berita');
        $query = $builder->get();
        return $query->getResult();
    }
}