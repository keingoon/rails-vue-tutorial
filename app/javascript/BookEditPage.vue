<template>
  <book-form-pane :errors="errors" :book="book" :commit="commit" @submit="updateBook"></book-form-pane>
</template>

<script>
  import axios from 'axios';

  import BookFormPane from 'BookFormPane.vue';

  export default{
    components: {
      BookFormPane
    },
    data() {
      return{
        book: {},
        errors: '',
        commit: '編集'
      }
    },
    mounted(){
      axios
        .get(`/api/v1/books/${this.$route.params.id}.json`)
        .then(response => (this.book = response.data))
    },
    methods: {
      updateBook: function() {
        axios
          .patch(`/api/v1/books/${this.book.id}`, this.book)
          .then(response => {
            this.$router.push({ name: 'BookDetailPage', params: {id: this.book.id}});
          })
          .catch(error => {
            console.error(error);
            if (error.response.data && error.response.data.errors){
              this.errors = error.response.data.errors;
            }
          });
      }
    }
  }
</script>

<style scoped>
</style>
