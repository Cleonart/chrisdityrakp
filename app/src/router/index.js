import Vue from 'vue'
import VueRouter from 'vue-router'
import Dashboard from '../views/Dashboard.vue'
import Jurnal from '../views/Jurnal.vue'
import Dosen from '../views/Dosen.vue'
import Akun from '../views/Akun.vue'
import Register from '../views/Register.vue'
import tambahArtikel from '../views/artikel/tambahArtikel.vue'
import artikel from '../views/artikel/artikel.vue'
import laporan_tambahJurnal from '../views/laporan_tambahJurnal'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'dashboard',
    component: Dashboard
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
    component: Akun
  },
  {
    path: '/register',
    name: 'Register',
    component: Register
  }
]

const router = new VueRouter({
  routes
})

export default router
