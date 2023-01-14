<?php

namespace App\Controllers;

use App\Models\M_user;
use App\Models\Jemaat;
use App\Models\BeritaModel;
use App\Models\Kategori;
use App\Models\AuthGroups;
use Myth\Auth\Models\UserModel;
use CodeIgniter\Controller;
use CodeIgniter\Session\Session;
use Myth\Auth\Config\Auth as AuthConfig;
use Myth\Auth\Entities\User;

class Admin extends BaseController
{

    protected $db, $builder, $model, $jemaat, $validation, $kategori, $berita;
    public function __construct()
    {
        $this->db = \Config\Database::connect();
        $this->builder = $this->db->table('users');
        $this->model = new M_user;
        $this->berita = new BeritaModel;
        $this->jemaat = new Jemaat;
        $this->kategori = new Kategori;
        $this->validation = \Config\Services::validation();
        helper('url', 'text');
    }




    public function index()
    {
        $data['title'] = 'Data User';
        // $users['users'] = new \Myth\Auth\Models\UserModel();
        // $data['users'] = $users->findAll();


        $this->builder->select('users.id as userid,email, username,mobile,fullname,name');
        $this->builder->join('auth_groups_users', 'auth_groups_users.user_id=users.id');
        $this->builder->join('auth_groups', 'auth_groups.id=auth_groups_users.group_id');
        $query =  $this->builder->get();
        $data['users'] = $query->getResult();
        return view('Admin/data_user', $data);
    }
    public function detailUser($id)
    {
        $data['title'] = 'Data User';
        // $users['users'] = new \Myth\Auth\Models\UserModel();
        // $data['users'] = $users->findAll();

        $this->builder->select('users.id as userid,email, username,user_img,mobile,fullname,name');
        $this->builder->join('auth_groups_users', 'auth_groups_users.user_id=users.id');
        $this->builder->join('auth_groups', 'auth_groups.id=auth_groups_users.group_id');
        $this->builder->where('users.id', $id);
        $query =  $this->builder->get();
        $data['user'] = $query->getRow();
        return view('Admin/detailUser', $data);
    }

    public function newUser()
    {

        $data = [
            'title' => 'Add New User',
            'validation' => \Config\Services::validation(),
        ];
        return view('Admin/addNewUser', $data);
    }
    public function tambah()
    {
        //Validasi 
        $rules = $this->validate([
            'username' => 'required|alpha_numeric_space|min_length[3]|max_length[30]|is_unique[users.username]',
            'email'    => 'required|valid_email|is_unique[users.email]',
            'mobile' => 'required|max_length[15]',
            'fullname' =>  'required|min_length[3]',
            'password_hash'     => 'required|strong_password',
            'pass_confirm' => 'required|matches[password_hash]',
            'role' => 'required',
        ]);
        // Jika Validation Fail
        if (!$rules) {
            session()->setFlashdata('error', 'Data User Tidak Dapat Ditambahkan !!!');
            return redirect()->back()->withInput();
        }
        // Ubah Url Title
        $slug_username = url_title($this->request->getVar('username'), '-', true);
        // Jika Data Valid
        $this->model->insert([
            'username' => $this->request->getVar('username'),
            'email' => $this->request->getVar('email'),
            'mobile' => $this->request->getVar('mobile'),
            'divisi' => $this->request->getVar('divisi'),
            'fullname' => $this->request->getVar('fullname'),
            'password_hash' => password_hash('password_hash', PASSWORD_DEFAULT),
        ]);
        return redirect()->to(base_url('/admin/newUser'))->with('success', 'Data User Berhasil Ditambahkan');
    }

    // Data Jemaat

    public function jemaat()
    {
        $data = ([
            'title' => 'Data Jemaat HKBP Beringin Indah',
            'jemaat'  => $this->jemaat->getJemaat(),
        ]);
        return view('Diakonia/data_jemaat', $data);
    }

    public function newJemaat()
    {
        $data = [
            'title' => 'Add New Jemaat',
            'validation' => \Config\Services::validation(),
        ];
        return view('Diakonia/addNewJemaat', $data);
    }
    public function addNewJemaat()
    {
        //Validasi 
        $rules = [
            'nama_jemaat' => 'required|alpha_numeric_space|min_length[3]|max_length[30]',
            'email'    => 'required|valid_email|is_unique[jemaat.email]',
            'nohp' => 'required|max_length[15]',
            'alamat' =>  'required|min_length[3]',
            'sektor'     => 'required',
            'jk' => 'required',
            'pekerjaan' => 'required',
            'img' => 'uploaded[img]|max_size[img,2064]|is_image[img]|mime_in[img,image/jpeg,image/jpg,image/png]',

        ];


        $error = [
            'nama_jemaat' => [
                'required' => 'Nama jemaat tidak boleh kosong !!',
                'min_length' => 'Minimal karakter 3 huruf !!',
                'max_length' => 'Maximal Karakter 128 huruf !!'
            ]
        ];
        if (!$this->validate($rules, $error)) {
            session()->setFlashdata('error', 'Data User Tidak Dapat Ditambahkan !!!');
            return redirect()->back()->withInput();
        }

        // Ubah Url Title
        $slug_username = url_title($this->request->getVar('nama_jemaat'), '-', true);
        // Jika Data Valid
        $img = $this->request->getFile('img');
        $filename = $img->getRandomName();

        $success =  $this->jemaat->insert([
            'nama_jemaat' => $this->request->getVar('nama_jemaat'),
            'email' => $this->request->getVar('email'),
            'nohp' => $this->request->getVar('nohp'),
            'alamat' => $this->request->getVar('alamat'),
            'sektor' => $this->request->getVar('sektor'),
            'tgl_lahir' => $this->request->getVar('tgl_lahir'),
            'umur' => $this->request->getVar('umur'),
            'kepala_keluarga' => $this->request->getVar('kepala_keluarga'),
            'nohp_kp' => $this->request->getVar('nohp_kp'),
            'pekerjaan' => $this->request->getVar('pekerjaan'),
            'jenis_kelamin' => $this->request->getVar('jk'),
            'img' => $filename,

        ]);
        $img->move('assets/vendors/images', $filename);
        if ($success) {
            session()->setFlashdata('success', 'Data Jemaat Berhasil Ditambahkan!!');
            return redirect()->to(base_url('/admin/jemaat'));
        }
    }

    public function detailJemaat($id)
    {
        $data = ([
            'title' => 'Detail Dan Edit Jemaat',
            'jemaat'  => $this->jemaat->detailJemaat($id),
            'kategori' => $this->kategori->findAll(),
            'validation' => \Config\Services::validation(),

        ]);
        // dd($data);

        return view('Diakonia/detail_jemaat', $data);
    }

    public function updateJemaat($id = 0)
    {

        //Validasi 
        $rules = [
            'nama_jemaat' => 'required|alpha_numeric_space|min_length[3]|max_length[128]',
            'email'    => 'is_unique[jemaat.email]',
            'nohp' => 'required|max_length[15]',
            'alamat' =>  'required|min_length[3]',
            'sektor'     => 'required',
            'jk' => 'required',
            'kategori' => 'required',
            'pekerjaan' => 'required',
            'kepala_keluarga' =>  'required|alpha_numeric_space|min_length[3]|max_length[128]',
            'nohp_kp' => 'required|max_length[15]',
            'img' => 'max_size[img,2064]|is_image[img]|mime_in[img,image/jpeg,image/jpg,image/png]',

        ];

        $error = [
            'nama_jemaat' => [
                'required' => 'Nama jemaat tidak boleh kosong !!',
                'min_length' => 'Minimal karakter 3 huruf !!',
                'max_length' => 'Maximal Karakter 128 huruf !!'
            ]
        ];


        if (!$this->validate($rules, $error)) {
            session()->setFlashdata('error', 'Data Jemaat Tidak Dapat Diubah !!!');
            return redirect()->back()->withInput();
        }

        // Ubah Url Title
        $slug_username = url_title($this->request->getVar('nama_jemaat'), '-', true);
        // Jika Data Valid
        $img = $this->request->getFile('img');

        // Validasi Gambar diubah atau tidak
        if ($img->getError() == 4) {
            $filename = $this->request->getVar('gambar_lama');
        } else {
            $filename = $img->getRandomName();

            // Arahkan Gambar Ke Direktori
            $img->move('assets/vendors/images', $filename);

            // Hapus Gambar Lama
            unlink('assets/vendors/images/' . $this->request->getPost('gambar_lama'));
        }


        $success =  $this->jemaat->update($id, [
            'nama_jemaat' => $this->request->getVar('nama_jemaat'),
            'nohp' => $this->request->getVar('nohp'),
            'alamat' => $this->request->getVar('alamat'),
            'sektor' => $this->request->getVar('sektor'),
            'kategori' => $this->request->getVar('kategori'),
            'pekerjaan' => $this->request->getVar('pekerjaan'),
            'jenis_kelamin' => $this->request->getVar('jk'),
            'tgl_lahir' => $this->request->getVar('tgl_lahir'),
            'umur' => $this->request->getVar('umur'),
            'nohp_kp' => $this->request->getVar('nohp_kp'),
            'kepala_keluarga' => $this->request->getVar('kepala_keluarga'),
            'img' => $filename,

        ]);

        if ($success) {
            session()->setFlashdata('success', 'Data Jemaat Berhasil Diubah!!');
            return redirect()->to(base_url('/admin/jemaat'));
        }
    }

    public function deleteJemaat($id = null)
    {
        $data['jemaat'] = $this->jemaat->where('id', $id)->delete();
        // $jemaat = $this->jemaat->find($id);
        // $this->jemaat->delete($id);
        return redirect()->back()->with('success', 'Data Jemaat Berhasil Dihapus !!');
    }

    // Berita

    public function berita()
    {
        $data = ([
            'title' => 'Data Berita',
            'berita' => $this->berita->getBerita(),

        ]);
        return view('admin/berita', $data);
    }

    public function formBerita()
    {
        $data = ([
            'title' => 'Form Tambah Berita',
            'validation' => \Config\Services::validation(),
            'kategori' => $this->kategori->findAll(),
        ]);
        return view('admin/AddNewBerita', $data);
    }

    public function addNewBerita()
    {
        // Validasi Form Data
        $rules = [
            'judul_berita' => 'required|alpha_numeric_space',
            'isi_berita' => 'trim|required|alpha_numeric_space',
            'kategori_berita' => 'required',
            'img' => 'uploaded[img]|max_size[img,2064]|is_image[img]|mime_in[img,image/jpeg,image/jpg,image/png]',
            'status' => 'required',


        ];
        $error = [
            'judul_berita' => [
                'required' => 'Judul Berita tidak boleh kosong !!',
            ],

            'isi_berita' => [
                'required' => 'Isi Berita tidak boleh kosong !!',
            ],
            'kategori' => [
                'required' => 'Kategori Berita tidak boleh kosong !!',
            ],
            'img' => [
                'uploaded' => 'Gambar tidak boleh kosong !!',
                'max_size' => 'Ukuran gambar Maximal 2 Mb !!!',
                'mime_in[img,image/jpeg,image/jpg,image/png]' => 'Gambar harus jpg/jpeg/png !!',
            ],
            'status' => [
                'required' => 'Status tidak boleh kosong !!',

            ]
        ];

        if (!$this->validate($rules, $error)) {
            session()->setFlashdata('error', 'Data Berita Tidak Dapat Ditambahkan !!!');
            return redirect()->back()->withInput();

            $img = $this->request->getFile('img');
            $filename = $img->getRandomName();

            // Kiri Field Database Kanan Field Name Form 
            $data = array(
                'username' => $this->request->getVar('username'),
                'user' => $this->request->getVar('user'),
                'judul_berita' => $this->request->getVar('judul_berita'),
                'isi_berita' => $this->request->getVar('isi_berita'),
                'kategori_berita' => $this->request->getVar('judul_berita'),
                'status' => $this->request->getVar('status'),
                'created' => date("Y-m-d H:i:s"),
                'modified' => date("Y-m-d H:i:s"),
                'img' => $filename,
            );

            // $img->move('assets/vendors/img_berita/', $filename);
            // $builder = $this->db->table("berita");
            // $success = $builder->insert($data);
            $img->move('assets/vendors/img_berita/', $filename);
            $success = $this->berita->insert_berita($data);
            if ($success) {
                session()->setFlashdata('success', 'Data Berita Berhasil Di!!');
                return redirect()->to(base_url('/admin/berita'));
            }
        }
    }
}