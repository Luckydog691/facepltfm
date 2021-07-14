<template>
  <div>
    <table>
      <tr>
        <th>编号</th>
        <th>名字</th>
        <th>年龄</th>
      </tr>
      <tr v-for="item in users">
        <td>{{item.id}}</td>
        <td>{{item.name}}</td>
        <td>{{item.age}}</td>
      </tr>
    </table>
  </div>
</template>

<script>
    export default {
        name: "user",
        data(){
          return {
            users:[
              {
                id: 1,
                name: '哈哈',
                age: 10
              },
              {
                id: 2,
                name: '嘎嘎',
                age: 14
              },
              {
                id: 3,
                name: '嘿嘿',
                age: 18
              }
            ]
          }
        }
    }
</script>

<style scoped>

</style>
