<?= $this->extend('/deskapp/includes/index') ?>
<!-- echo header,rightsidebar,leftsidebar and loader -->
<?= $this->section('main-content'); ?>

<div class="main-container">
    <div class="pd-ltr-20 xs-pd-20-10">
        <div class="min-height-200px">
            <div class="page-header">
                <div class="row">
                    <div class="col-md-6 col-sm-12">
                        <div class="title">
                            <h4>Form</h4>
                        </div>
                        <nav aria-label="breadcrumb" role="navigation">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item">
                                    <a href="index.html">Home</a>
                                </li>
                                <li class="breadcrumb-item active" aria-current="page">
                                    <?= $title; ?>
                                </li>
                            </ol>
                        </nav>
                    </div>
                    <!-- <div class="col-md-6 col-sm-12 text-right">
                        <div class="dropdown">
                            <a class="btn btn-secondary dropdown-toggle" href="#" role="button" data-toggle="dropdown">
                                January 2018
                            </a>
                            <div class="dropdown-menu dropdown-menu-right">
                                <a class="dropdown-item" href="#">Export List</a>
                                <a class="dropdown-item" href="#">Policies</a>
                                <a class="dropdown-item" href="#">View Assets</a>
                            </div>
                        </div>
                    </div> -->
                </div>
            </div>
            <!-- Default Basic Forms Start -->
            <div class="pd-20 card-box mb-30">
                <div class="clearfix">
                    <div class="pull-left">
                        <h4 class="text-blue h4">Tambah Data Berita</h4>
                        <p class="mb-30">Gunakan Ketentuan !!</p>
                    </div>
                    <!-- <div class="pull-right">
                        <a href="#basic-form1" class="btn btn-primary btn-sm scroll-click" rel="content-y"
                            data-toggle="collapse" role="button"><i class="fa fa-code"></i> Source Code</a>
                    </div> -->
                </div>
                <!-- Notifikasi Alert Berhasil -->
                <?php if (session('success')) : ?>
                <div class="alert alert-success" role="alert">
                    <?= session('success'); ?>
                </div>
                <?php endif; ?>
                <!-- Notifikasi Alert Gagal -->
                <?php if (session('error')) : ?>
                <div class="alert alert-danger" role="alert">
                    <?= session('error'); ?>
                </div>
                <?php endif; ?>
                <form action="<?= base_url('/admin/addNewJemaat'); ?>" enctype="multipart/form-data" method="post"
                    class="user">
                    <?= csrf_field() ?>

                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Judul Berita</label>
                        <div class="col-sm-12 col-md-10">
                            <input name="judul_berita" value="<?= set_value('judul_berita'); ?>"
                                class="form-control <?= $validation->hasError('judul_berita') ? 'is-invalid' : null ?>"
                                type="text" placeholder="Masukkan Judul Berita" />
                            <input class="form-control" type="text" placeholder="Parataon" name="id" hidden />
                            <?php if ($validation->hasError('judul_berita')) : ?>
                            <div class="invalid-feedback">
                                <?= $validation->getError('judul_berita'); ?>
                            </div>
                            <?php endif; ?>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Isi Berita</label>
                        <div class="html-editor pd-20 col-sm-12 col-md-10">
                            <textarea class="textarea_editor form-control border-radius-0"
                                placeholder="Enter text ..."></textarea>
                            <?php if ($validation->hasError('isi_berita')) : ?>
                            <div class="invalid-feedback">
                                <?= $validation->getError('isi_berita'); ?>
                            </div>
                            <?php endif; ?>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Pekerjaan</label>
                        <div class="col-sm-12 col-md-10">
                            <input name="pekerjaan"
                                class="form-control <?= $validation->hasError('pekerjaan') ? 'is-invalid' : null ?>"
                                type="text" placeholder="Mahasiswa" value="<?= set_value('pekerjaan'); ?>" />
                            <?php if ($validation->hasError('pekerjaan')) : ?>
                            <div class="invalid-feedback">
                                <?= $validation->getError('pekerjaan'); ?>
                            </div>
                            <?php endif; ?>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Sektor</label>
                        <div class="col-sm-12 col-md-10">
                            <input name="sektor" value="<?= set_value('sektor'); ?>"
                                class="form-control <?= $validation->hasError('sektor') ? 'is-invalid' : null ?>"
                                type="text" placeholder="Parataon" />
                            <?php if ($validation->hasError('sektor')) : ?>
                            <div class="invalid-feedback">
                                <?= $validation->getError('sektor'); ?>
                            </div>
                            <?php endif; ?>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Telephone</label>
                        <div class="col-sm-12 col-md-10">
                            <input class="form-control <?= $validation->hasError('nohp') ? 'is-invalid' : null ?>"
                                name="nohp" placeholder="089500112233" type="tel" value="<?= set_value('nohp'); ?>" />
                            <?php if ($validation->hasError('nohp')) : ?>
                            <div class="invalid-feedback">
                                <?= $validation->getError('nohp'); ?>
                            </div>
                            <?php endif; ?>
                        </div>
                    </div>


                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Status</label>
                        <div class="col-sm-12 col-md-10">
                            <select name="status"
                                class="custom-select col-12 <?= $validation->hasError('status') ? 'is-invalid' : null ?>">
                                <option value="" disabled selected hidden>--Choice--</option>
                                <option value="1">Aktiv</option>
                                <option value="0">Non-Activ</option>
                            </select>
                            <?php if ($validation->hasError('status')) : ?>
                            <div class="invalid-feedback">
                                <?= $validation->getError('status'); ?>
                            </div>
                            <?php endif; ?>
                        </div>

                    </div>
                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Profile</label>
                        <div class="col-sm-12 col-md-10">
                            <input class="form-control <?= $validation->hasError('img') ? 'is-invalid' : null ?>"
                                name="img" placeholder="Jalan Purodadi No 25" type="file"
                                value="<?= set_value('img'); ?>" accept="image/*" />
                            <?php if ($validation->hasError('img')) : ?>
                            <div class="invalid-feedback">
                                <?= $validation->getError('img'); ?>
                            </div>
                            <?php endif; ?>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="pull-right ml-lg-5 mt-30">
                            <button class="btn btn-primary  " href="#" type="submit">
                                Submit</button>
                            <button class="btn btn-danger " href="#" type="submit">
                                Cancel</button>
                        </div>
                    </div>

                </form>

            </div>
        </div>

    </div>
</div>
<!-- Default Basic Forms End -->







<?php $this->endSection(); ?>
<!-- <div class="html-editor pd-20 card-box mb-30">
                    <h4 class="h4 text-blue">bootstrap wysihtml5</h4>
                    <p>Simple, beautiful wysiwyg editors</p>
                    <textarea class="textarea_editor form-control border-radius-0"
                        placeholder="Enter text ..."></textarea>
                </div> -->