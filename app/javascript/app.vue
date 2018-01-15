<template>
  <div>
    <button @click="edit">click me</button>
  </div>
</template>

<script>
  export default {
    data() {
      return {}
    },
    methods: {
      edit() {
        console.log("hoge")
      }
    }
  }
</script>