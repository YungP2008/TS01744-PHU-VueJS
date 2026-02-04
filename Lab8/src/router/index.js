import { createRouter, createWebHistory } from 'vue-router';
// Import các component để điều hướng
import Home from '../views/Home.vue';
import About from '../views/About.vue';

const routes = [
    {
        path: '/',
        name: 'Home',
        component: Home
    },
    {
        path: '/about',
        name: 'About',
        component: About
    }
];

const router = createRouter({
    // Sử dụng lịch sử trình duyệt (HTML5 History Mode)
    history: createWebHistory(import.meta.env.BASE_URL),
    routes
});

export default router;