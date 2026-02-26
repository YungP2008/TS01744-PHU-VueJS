import { createRouter, createWebHistory } from 'vue-router'
import Home from '../views/Home.vue'
import BlogList from '../views/BlogList.vue'
import BlogPost from '../views/BlogPost.vue'
import UserProfile from '../views/UserProfile.vue'
import ProfileInfo from '../views/ProfileInfo.vue'
import ProfileSettings from '../views/ProfileSettings.vue'
import Login from '../views/Login.vue'
import Dashboard from '../views/Dashboard.vue'

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/blog',
    name: 'BlogList',
    component: BlogList
  },
  {
    path: '/blog/:id',
    name: 'BlogPost',
    component: BlogPost,
    props: true
  },
  {
    path: '/profile',
    alias: '/me',
    name: 'UserProfile',
    component: UserProfile,
    children: [
      {
        path: 'info',
        name: 'ProfileInfo',
        component: ProfileInfo
      },
      {
        path: 'settings',
        name: 'ProfileSettings',
        component: ProfileSettings
      }
    ]
  },
  {
    path: '/login',
    name: 'Login',
    component: Login
  },
  {
    path: '/dashboard',
    name: 'Dashboard',
    component: Dashboard,
    meta: { requiresAuth: true }
  }
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

router.beforeEach((to, from, next) => {
  const isAuthenticated = localStorage.getItem('isAuthenticated') === 'true'
  if (to.meta.requiresAuth && !isAuthenticated) {
    next({ name: 'Login' })
  } else {
    next()
  }
})

export default router