import Vue from 'vue'
import VueRouter from 'vue-router'
import Dashboard from '../views/Dashboard.vue'
import Jurnal from '../views/Jurnal.vue'
import Dosen from '../views/Dosen.vue'

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
    path: '/tambah-jurnal',
    name: 'Jurnal_Add',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/Jurnal_Add.vue')
  }
]

const router = new VueRouter({
  routes
})

export default router
