import { createRouter, createWebHistory } from 'vue-router'

const Welcome = () => import('@/views/home/WelcomePage.vue')
const Login = () => import('@/views/auth/Login.vue')
const Dashboard = () => import('@/views/dashboard/Dashboard.vue')

const routes = [
  {
    path: '/',
    name: 'Welcome',
    component: Welcome,
    meta: { layout: 'full', requiresAuth: false }
  },
  {
    path: '/login',
    name: 'Login',
    component: Login,
    meta: { layout: 'full', requiresAuth: false }
  },
  {
    path: '/dashboard',
    name: 'Dashboard',
    component: Dashboard,
    meta: { layout: 'default', requiresAuth: true }
  }
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

router.beforeEach((to, from, next) => {
  const token = localStorage.getItem('token')
  const isAuthenticated = !!token
  
  if (to.meta.requiresAuth && !isAuthenticated) {
    next('/login')
  } else if ((to.path === '/login' || to.path === '/') && isAuthenticated) {
    next('/dashboard')
  } else {
    next()
  }
})

export default router