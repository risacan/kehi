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
      },
      setExpenseId(id) {
        axios.get(`api/expenses/${id}.json`)
        .then(res => {
          this.expenseInfo = res.data;
        });
      }
    }
  }
</script>