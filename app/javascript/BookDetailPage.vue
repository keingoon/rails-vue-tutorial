<template>
  <div>
    <h3 class="text-center">本の詳細情報</h3>
    <table class="table">
      <tr>
        <th>ID</th>
        <td>{{ book.id }}</td>
      </tr>
      <tr>
        <th>本の名前</th>
        <td>{{ book.name }}</td>
      </tr>
      <tr>
        <th>著者名</th>
        <td>{{ book.author }}</td>
      </tr>
      <tr>
        <th>AmazonのURL</th>
        <td>{{ book.amazon_url }}</td>
      </tr>
      <tr>
        <th>メモ</th>
        <td>{{ book.memo }}</td>
      </tr>
      <tr>
        <th>出版日</th>
        <td>{{ book.published_day }}</td>
      </tr>
    </table>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data: function () {
    return {
      book: {}
    }
  },
  mounted () {
    axios
      .get(`/api/v1/books/${this.$route.params.id}.json`)
      .then(response => (this.book = response.data))
  }
}
</script>

<style scoped>
</style>
