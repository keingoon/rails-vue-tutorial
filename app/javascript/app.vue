<template>
  <div class="container">
    <router-view></router-view>
  </div>
</template>

<script>
import Vue from 'vue'
import VueRouter from 'vue-router'

import BookIndexPage from 'BookIndexPage.vue'
import BookDetailPage from 'BookDetailPage.vue'
import BookNewPage from 'BookNewPage.vue'
import BookEditPage from 'BookEditPage.vue'

Vue.use(VueRouter)

const router = new VueRouter({
  routes: [
    { path: '/',
      component: BookIndexPage },
    { path: '/books/:id(\\d+)',
      name: 'BookDetailPage',
      component: BookDetailPage },
    { path: '/books/new',
      name: 'BookNewPage',
      component: BookNewPage },
    { path: '/books/:id(\\d+)/edit',
      name: 'BookEditPage',
      component: BookEditPage }
  ]
})

export default{
  router
}
</script>

<style scoped>
</style>
