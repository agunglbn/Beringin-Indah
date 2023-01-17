<?= $this->extend('/deskapp/includes/index') ?>
<!-- echo header,rightsidebar,leftsidebar and loader -->
<?= $this->section('main-content'); ?>
<div class="main-container">
    <div class="pd-ltr-20 xs-pd-20-10">
        <div class="min-height-200px">
            <div class="page-header">
                <div class="row">
                    <div class="col-md-12 col-sm-12">
                        <div class="title">
                            <h4>Blog Detail</h4>
                        </div>
                        <nav aria-label="breadcrumb" role="navigation">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item">
                                    <a href="">Home</a>
                                </li>
                                <li class="breadcrumb-item active" aria-current="page">
                                    Blog Detail
                                </li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
            <div class="blog-wrap">
                <div class="container pd-0">
                    <div class="row">
                        <div class="col-md-8 col-sm-12">
                            <div class="blog-detail card-box overflow-hidden mb-30">
                                <div class="blog-img">
                                    <img src="<?= base_url('/assets/vendors/img_berita/' . $berita[0]['img']); ?>"
                                        alt="" />
                                </div>
                                <div class="blog-caption">
                                    <h4 class="mb-10">
                                        <?= $berita[0]['judul_berita']; ?>
                                    </h4>
                                    <p>
                                        <?= $berita[0]['isi_berita']; ?>
                                    </p>
                                    <h5 class="mb-10">

                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-12">
                            <div class="card-box mb-30">
                                <h5 class="pd-20 h5 mb-0">Categories</h5>
                                <div class="list-group">

                                    <a href="#"
                                        class="list-group-item d-flex align-items-center justify-content-between">HTML
                                        <span class="badge badge-primary badge-pill">7</span></a>

                                    <a href="#"
                                        class="list-group-item d-flex align-items-center justify-content-between active">Bootstrap
                                        <span class="badge badge-primary badge-pill">8</span></a>

                                </div>
                            </div>
                            <div class="card-box mb-30">
                                <h5 class="pd-20 h5 mb-0">Latest Post</h5>
                                <div class="latest-post">
                                    <ul>
                                        <li>
                                            <h4>
                                                <a href="#">Ut enim ad minim veniam, quis nostrud
                                                    exercitation ullamco</a>
                                            </h4>
                                            <span>HTML</span>
                                        </li>
                                        <li>
                                            <h4>
                                                <a href="#">Lorem ipsum dolor sit amet, consectetur
                                                    adipisicing elit</a>
                                            </h4>
                                            <span>Css</span>
                                        </li>
                                        <li>
                                            <h4>
                                                <a href="#">Ut enim ad minim veniam, quis nostrud
                                                    exercitation ullamco</a>
                                            </h4>
                                            <span>jQuery</span>
                                        </li>
                                        <li>
                                            <h4>
                                                <a href="#">Lorem ipsum dolor sit amet, consectetur
                                                    adipisicing elit</a>
                                            </h4>
                                            <span>Bootstrap</span>
                                        </li>
                                        <li>
                                            <h4>
                                                <a href="#">Lorem ipsum dolor sit amet, consectetur
                                                    adipisicing elit</a>
                                            </h4>
                                            <span>Design</span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="card-box overflow-hidden">
                                <h5 class="pd-20 h5 mb-0">Archives</h5>
                                <div class="list-group">
                                    <a href="#"
                                        class="list-group-item d-flex align-items-center justify-content-between">January
                                        2020</a>
                                    <a href="#"
                                        class="list-group-item d-flex align-items-center justify-content-between">February
                                        2020</a>
                                    <a href="#"
                                        class="list-group-item d-flex align-items-center justify-content-between">March
                                        2020</a>
                                    <a href="#"
                                        class="list-group-item d-flex align-items-center justify-content-between">April
                                        2020</a>
                                    <a href="#"
                                        class="list-group-item d-flex align-items-center justify-content-between">May
                                        2020</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-4 col-sm-12 mb-30">
            <div class="pd-20 card-box height-100-p">
                <h5 class="h4">Confirmation modal</h5>
                <a href="#" class="btn-block" data-toggle="modal" data-target="#confirmation-modal" type="button">
                    <img src="vendors/images/modal-img3.jpg" alt="modal" />
                </a>
                <div class="modal fade" id="confirmation-modal" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-body text-center font-18">
                                <h4 class="padding-top-30 mb-30 weight-500">
                                    Are you sure you want to continue?
                                </h4>
                                <div class="padding-bottom-30 row" style="max-width: 170px; margin: 0 auto">
                                    <div class="col-6">
                                        <button type="button"
                                            class="btn btn-secondary border-radius-100 btn-block confirmation-btn"
                                            data-dismiss="modal">
                                            <i class="fa fa-times"></i>
                                        </button>
                                        NO
                                    </div>
                                    <div class="col-6">
                                        <button type="button"
                                            class="btn btn-primary border-radius-100 btn-block confirmation-btn"
                                            data-dismiss="modal">
                                            <i class="fa fa-check"></i>
                                        </button>
                                        YES
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php $this->endSection(); ?>