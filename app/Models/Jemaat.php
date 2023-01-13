<?php

namespace App\Models;

use CodeIgniter\Model;

class Jemaat extends Model
{
    protected $table            = 'jemaat';
    protected $primaryKey       = 'id';
    protected $useAutoIncrement = true;
    protected $insertID         = 0;
    protected $returnType       = 'array';
    protected $useSoftDeletes   = false;
    protected $protectFields    = true;
    protected $allowedFields    = [
        'nama_jemaat', 'email', 'nohp', 'sektor', 'jenis_kelamin', 'tgl_lahir', 'umur', 'kategori', 'alamat',
        'pekerjaan', 'kepala_keluarga', 'nohp_kp', 'img', 'created', 'modified', 'status'
    ];

    // Dates
    protected $useTimestamps = true;
    protected $dateFormat    = 'datetime';
    protected $createdField  = 'created';
    protected $updatedField  = 'modified';
    protected $deletedField  = '';

    public function getJemaat()
    {
        return $this->findAll();
    }

    public function detailJemaat($id)
    {
        $sql = "Select * From jemaat WHERE id='$id'";
        $query  = $this->db->query($sql);
        $data = $query->getResultArray();
        return $data;
    }
}