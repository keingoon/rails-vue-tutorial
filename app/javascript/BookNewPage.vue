<template>
  <book-form-pane :errors="errors" :book="book" :commit="commit" @submit="createBook"></book-form-pane>
</template>

<script>
import axios from 'axios';

import BookFormPane from 'BookFormPane.vue';

export default {
  components: {
    BookFormPane
  },
  data: function () {
    return {
      book: {
        name: '',
        author: '',
        amazon_url: '',
        memo: '',
        published_day: ''
      },
      errors: '',
      commit: '新規登録'
    }
  },
  methods: {
    createBook: function() {
      axios
        .post('/api/v1/books', this.book)
        .then(response => {
          let b = response.data;
          this.$router.push({ name: 'BookDetailPage', params: { id: b.id }});
        })
        .catch(error => {
          console.error(error);
          if (error.response.data && error.response.data.errors) {
            this.errors = error.response.data.errors;
          }
        });
    }
  }
}
</script>

<style scoped>
</style>
