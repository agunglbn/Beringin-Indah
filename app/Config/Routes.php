<?php

namespace Config;

// Create a new instance of our RouteCollection class.
$routes = Services::routes();

// Load the system's routing file first, so that the app and ENVIRONMENT
// can override as needed.
if (is_file(SYSTEMPATH . 'Config/Routes.php')) {
    require SYSTEMPATH . 'Config/Routes.php';
}

/*
 * --------------------------------------------------------------------
 * Router Setup
 * --------------------------------------------------------------------
 */
$routes->setDefaultNamespace('App\Controllers');
$routes->setDefaultController('Home');
$routes->setDefaultMethod('index');
$routes->setTranslateURIDashes(false);
$routes->set404Override();
$routes->setAutoRoute(true);
// The Auto Routing (Legacy) is very dangerous. It is easy to create vulnerable apps
// where controller filters or CSRF protection are bypassed.
// If you don't want to define all routes, please use the Auto Routing (Improved).
// Set `$autoRoutesImproved` to true in `app/Config/Feature.php` and set the following to true.
// $routes->setAutoRoute(false);

/*
 * --------------------------------------------------------------------
 * Route Definitions
 * --------------------------------------------------------------------
 */

// We get a performance increase by specifying the default
// route since we don't have to scan directories.
$routes->get('/', 'User::index');
$routes->get('/admin', 'Admin::index', ['filter' => 'role:admin']);
$routes->get('/admin/index', 'Admin::index', ['filter' => 'role:admin']);
$routes->get('/admin/(:num)', 'Admin::detailUser/$1', ['filter' => 'role:admin']);
$routes->get('/admin/newUser', 'Admin::newUser', ['filter' => 'role:admin']);
$routes->post('/admin/tambah', 'Admin::tambah', ['filter' => 'role:admin']);
// Jemaat
$routes->get('/admin/jemaat', 'Admin::jemaat', ['filter' => 'role:admin']);
$routes->post('/admin/addNewJemaat', 'Admin::addNewJemaat', ['filter' => 'role:admin']);
$routes->get('/admin/(:num)', 'Admin::detailJemaat/$1', ['filter' => 'role:admin']);
$routes->post('/admin/(:num)', 'Admin::updateJemaat/$1', ['filter' => 'role:admin']);
$routes->delete('/admin/(:num)', 'Admin::deleteJemaat/$1', ['filter' => 'role:admin']);
// Berita
$routes->get('/admin/berita', 'Admin::berita', ['filter' => 'role:admin']);
$routes->get('/admin/formBerita', 'Admin::formBerita', ['filter' => 'role:admin']);
$routes->post('/admin/TambahBerita', 'Admin::TambahBerita', ['filter' => 'role:admin']);
$routes->get('/detailBerita/(:segment)', 'Admin::detailBerita/$1', ['filter' => 'role:admin']);
$routes->delete('/admin/deleteBerita/(:num)', 'Admin::deleteBerita/$1', ['filter' => 'role:admin']);
$routes->post('/admin/updateStatusBerita(:num)', 'Admin::updateStatusBerita/$1', ['filter' => 'role:admin']);








/*
 * --------------------------------------------------------------------
 * Additional Routing
 * --------------------------------------------------------------------
 *
 * There will often be times that you need additional routing and you
 * need it to be able to override any defaults in this file. Environment
 * based routes is one such time. require() additional route files here
 * to make that happen.
 *
 * You will have access to the $routes object within that file without
 * needing to reload it.
 */
if (is_file(APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php')) {
    require APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php';
}