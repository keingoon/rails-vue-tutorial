<template>
  <div id="app">
    <div class="table-responsive">
      <table class="table table-bordered text-nowrap">
        <tbody>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">本の名前</th>
            <th scope="col">著者</th>
            <th scope="col">AmazonのURL</th>
            <th scope="col">メモ</th>
            <th scope="col">出版日</th>
            <th scope="col">削除ボタン</th>
          </tr>
          <tr v-for="b in books" :key="b.id">
            <td><router-link :to="{ name: 'BookDetailPage', params: { id: b.id } }">{{ b.id }}</router-link></td>
            <td>{{ b.name }}</td>
            <td>{{ b.author }}</td>
            <td>{{ b.amazon_url }}</td>
            <td>{{ b.memo }}</td>
            <td>{{ b.published_day }}</td>
            <td>
              <button class="btn btn-primary" @click="deleteTarget = b.id; showModal = true;">削除</button>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
    <router-link to="/books/new">新規作成</router-link>
    <modal v-if="showModal" @cancel="showModal = false;" @ok="deleteBook(); showModal = false;">
      <div slot="body" class="text-center">削除して良い？</div>
    </modal>
  </div>
</template>

<script>
import axios from 'axios';

import Modal from 'Modal.vue';

export default {
  components: {
    Modal
  },
  data: function () {
    return {
      books: [],
      showModal: false,
      deleteTarget: -1,
      errors: ''
    }
  },
  mounted (){
    axios
      .get('/api/v1/books.json')
      .then(response => (this.books = response.data))
  },
  methods: {
    deleteBook: function(){
      if (this.deleteTarget <= 0){
        console.warn('deleteTarget should be grater than zero.');
        return;
      }

      axios
        .delete(`/api/v1/books/${this.deleteTarget}`)
        .then(response => {
          this.deleteTarget = -1;
          this.updateBooks();
        })
        .catch(error => {
          console.error(error);
          if (error.response.data && error.response.data.errors) {
            this.errors = error.response.data.errors;
          }
        });
      },
      updateBooks: function() {
        axios
          .get('/api/v1/books.json')
          .then(response => (this.books = response.data))
      }
   }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
