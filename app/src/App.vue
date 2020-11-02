<template>
  <div id="app container">
    <div class="lnavbar">
      
    </div>
    <div class="row mr-5" style="z-index:99">
      <div class="col-lg-3">
        <div class="sidebar">
          <div class="m-1 mt-4 ml-4">
            <p><img src="./assets/logo.png" style="width:60px"></p>
            <h5 class="mb-4">LPPM DLSU</h5>
          </div>
          <span v-for="(item, index) in sidebar_item">
              <div class="sidebar-item" :class="item.class" @click="changeRoute(index)" v-if="item.icon">
                <b-link :class="item.class +'-text'" class="item ml-4" :href="item.ref"><b-icon :icon="item.icon"></b-icon><span class="ml-3">{{item.title}}</span></b-link>
              </div>
              <p v-else class="ml-4" style="opacity:0.6;font-size:12px;text-transform:uppercase">
                <b>{{item.title}}</b>
              </p>
            </span>
        </div>
      </div>
      <div class="col-lg-9">
        <div style="margin-top:90px;"></div>
        <router-view></router-view>
      </div>
    </div>
  </div>
</template>

<script>
  export default{
    data(){
      return{
        auth_level : 1,
        sidebar_item : [
          {
            title : "Dashboard",
            icon  : 'house',
            ref   : '/#',
            class : 'active'
          },
          {
            title : "JURNAL"
          },
          {
            title : "Jurnal",
            icon : "journals",
            ref   : '/#/jurnal',
            class : ''
          },
          {
            title : "Tambah Jurnal",
            icon : "journal-plus",
            ref   : '/#/tambah-jurnal',
            class : ''
          },
          {
            title : "Pengaturan Jurnal",
            icon : "journal-code",
            ref   : '/',
            class : ''
          },
          {
            title : "AKUN"
          },
          {
            title : "Forum",
            icon : "chat",
            ref   : '/',
            class : ''
          },
          {
            title : "Dosen",
            icon : "people",
            ref   : '/',
            class : ''
          },
        ]
      }
    },
    methods : {
      changeRoute : function(index) {
        for(var i = 0; i < this.sidebar_item.length; i++){
          if(i == index){
            this.sidebar_item[i].class = "active";
          }
          else{
           this.sidebar_item[i].class = ""; 
          }
        }
      }
    }
  }
</script>

<style>

.active::before{
  width:4px;
  height:20px;
  content:'1';
  color:transparent;
  background-color:#2ecc71;
  position:absolute;
}

.active-text{
  color:#2ecc71;
}

.-text{
  color:#000;
}

.lnavbar{
  background-color:#27ae60;
  width:100%;
  height:60px;
  position:absolute;
  z-index:-1;
  box-shadow: 0px 7px 21px 0px rgba(50, 50, 50, 0.1);
}

.sidebar{
  height: 100vh;
  width: 250px;
  position: fixed;
  box-shadow: 7px 0px 21px 0px rgba(50, 50, 50, 0.10);
  z-index: 99;
  background-color: #fff;
}

.sidebar .sidebar-item{
  margin-bottom: 15px;
  transition: all 0.2s ease;
  cursor: pointer;
}

.sidebar .sidebar-item .item{
  text-decoration:none;
  transition:all 0.2s ease;
}

.sidebar .sidebar-item .item:hover{
  color:#2ecc71;
}

.sidebar .sidebar-item:hover{
  transform: translateX(5px);
}

#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

#nav {
  padding: 30px;
}

#nav a {
  font-weight: bold;
  color: #2c3e50;
}

#nav a.router-link-exact-active {
  color: #42b983;
}
</style>
