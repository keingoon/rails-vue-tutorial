<template>
  <div>
    <h2 class="text-center">{{commit}}</h2>
    <form @submit.prevent="$emit('submit')">
      <div v-if="errors.length != 0">
        <ul v-for="e in errors" :key="e">
          <li><font color="red">{{ e }}</font></color></li>
        </ul>
      </div>
      <div class="form-group">
        <label>本の名前</label>
        <input v-model="book.name" type = "text" class="form-control">
      </div>
      <div class="form-group">
        <label>著者</label>
        <input v-model="book.author" type = "text" class="form-control">
      </div>
      <div class="form-group">
        <label>amazonのURL</label>
        <input v-model="book.amazon_url" type = "text" class="form-control">
      </div>
      <div class="form-group">
        <label>メモ</label>
        <input v-model="book.memo" type = "text" class="form-control">
      </div>
      <div class="form-group col-4">
        <label>出版日</label>
        <input v-model="book.published_day" type = "date" class="form-control">
      </div>
      <button type="submit" class="btn btn-primary">{{ commit }}</button>
    </form>
  </div>
</template>

<script>
export default {
  props: {
    book: {},
    errors: '',
    commit: ''
  }
}
</script>

<style>
</style>
