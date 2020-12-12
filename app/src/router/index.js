import Vue from 'vue'
import VueRouter from 'vue-router'
import Beranda from '../views/Beranda.vue'
import Jurnal from '../views/Jurnal.vue'
import Dosen from '../views/Dosen.vue'
import Akun from '../views/Akun.vue'
import Register from '../views/Register.vue'
import tambahArtikel from '../views/artikel/tambahArtikel.vue'
import artikel from '../views/artikel/artikel.vue'
import laporan_tambahJurnal from '../views/laporan_tambahJurnal'
import Forum from '../views/Forum.vue'
import tambahEdisi from '../views//tambahEdisi.vue'

//akun
import Daftar from '../views/akun/daftar';
import List from '../views/akun/list';
import Login from '../views/akun/login';

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Beranda',
    component: Beranda
  },
  {
    path: '/login',
    name: 'Login',
    component: Login
  },
  {
    path: '/jurnal',
    name: 'Jurnal',
    component: Jurnal
  },
  {
    path: '/dosen',
    name: 'Dosen',
    component: Dosen
  },
  {
    path: '/tambahJurnal',
    name: 'tambahJurnal',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/tambahJurnal.vue')
  },
  {
    path: '/laporan-tambahJurnal',
    name: 'laporan-tambahJurnal',
    component : laporan_tambahJurnal
  },
  {
    path: '/tambahArtikel',
    name: 'Tambah_Artikel',
    component : tambahArtikel
  },
  {
    path: '/artikel',
    name: 'Artikel',
    component : artikel
  },
  {
    path: '/akun',
    name: 'Akun',
    component: List
  },
  {
    path: '/akun/:id',
    name: 'Akun',
    component: Daftar
  },
  {
    path: '/register',
    name: 'Register',
    component: Register
  },
  {
    path: '/forum',
    name: 'Forum',
    component: Forum
  },
  {
    path: '/tambahEdisi',
    name: 'tambahEdisi',
    component: tambahEdisi
  }
]

const router = new VueRouter({
  routes
})

export default router
