<template>
  <div id="app container">
    <!--
    <div class="lnavbar">
      <b-navbar toggleable="lg" type="dark" variant="success">
        <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>
    <b-collapse id="nav-collapse" is-nav>

      
      <b-navbar-nav class="ml-auto">

        <b-nav-item-dropdown right>
          <template #button-content>
            <b-icon icon="bell" class="mt-2"></b-icon>
          </template>
          <b-dropdown-item href="#" v-for="notif in notification">
            <table style="border:none">
              <tr>
                <td><b-icon :icon="notif.icon" class="mt-2"></b-icon></td>
                <td><span style="margin-left:7px;width:20px;word-wrap: break-word">{{notif.text}}</span></td>
              </tr>
            </table>
          </b-dropdown-item>
        </b-nav-item-dropdown>

        <b-nav-item-dropdown right>
          <template #button-content>
            <b-avatar icon="star-fill"></b-avatar>
          </template>

          <b-dropdown-item href="#/akun">
            <div>
              <p style="text-align:center" class="mb-2 mt-2"><b-avatar variant="primary" text="CL"></b-avatar></p>
              <p style="text-align:center" class="mb-0"><b>Chrisdityra Lengkey</b></p>
              <p style="text-align:center" class="mb-2">51099290100</p>
            </div>
          </b-dropdown-item>

          <b-dropdown-item href="#" variant="danger"><b-icon icon="power" variant="danger" class="mr-2"></b-icon>Keluar</b-dropdown-item>

        </b-nav-item-dropdown>

      </b-navbar-nav>

    </b-collapse>

  </b-navbar>

    </div>-->

    <div class="row" :class="[loggedIn ? 'mr-5' : '']" style="z-index:99">
      <div class="col-lg-3" v-if="loggedIn">
        <div class="sidebar" style="z-index: 0">
          <div class="m-1 mt-4 ml-4 mb-4">
            <p><img src="./assets/logo.png" style="width:48px"></p>
            <p class="title is-5 text-white mb-2"><b>Halo, {{account_name}}!</b></p>
            <p class="subtitle text-white is-6 mt-0">Silahkan kelola jurnal anda</p>
            <div style="border-top: 1px solid #fff;width: 35px"></div>
          </div>
          <span v-for="(item, index) in sidebar_item">
              <b-link class="item" style="text-decoration: none;" v-if="item.icon" @click="changeRoute(index)" :href="item.ref">
                <div class="sidebar-item" :class="item.class" style="margin-left: 10px;max-width: 200px">
                  <span :class="item.class +'-text'" class="ml-1" >
                    <span class="ml-3 text-white" style="font-family: 'Averta';font-weight: bold; font-size: 13.2px;">{{item.title}}</span>
                  </span>
                </div>
              </b-link>
              <p v-else class="ml-4" style="opacity:0.6;font-size:12px;text-transform:uppercase">
                <b>{{item.title}}</b>
              </p>
            </span>
            <p @click="logOut()" style="cursor: pointer;background-color:  #e74c3c;color:#FFF;padding-top:7px;padding-bottom:7px;border-radius: 5px; font-size:13px;margin-left:   17px;padding-left:  13px;width: 193px;"><b>LOG OUT</b></p>
        </div>
      </div>
      <!-- if logged in -->
      <div :class="[loggedIn ? 'col-lg-9' : 'col-lg-12']">
        <div style="margin-top:20px;"></div>
        <transition name="fade" mode="out-in">
          <router-view></router-view>
        </transition>
      </div>
    </div>
    <Chat v-if="loggedIn"></Chat>
  </div>
</template>

<script>
  import Chat from './views/chat/chat.vue';
  import {validateLoginCredential, getAccountName, loggedIn} from './functions/universal.js';

  export default{
    components : {
        Chat
    },
    data(){
      return{
        account_name : null,
        loggedIn : false,
        auth_level : 1,
        sidebar_item : [
          {
            title : "Beranda",
            icon  : 'house',
            ref   : '/#/',
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
            ref   : '/#/tambahJurnal',
            class : ''
          },
          {
            title : "Tambah Edisi",
            icon : "journal-plus",
            ref : '/#/tambahEdisi',
            class : ''
          },
          {
            title : "Laporan Tambah Jurnal",
            icon : "journal-arrow-down",
            ref   : '/#/laporan-tambahJurnal',
            class : ''
          },
          {
            title : "ARTIKEL"
          },
          {
            title : "Artikel",
            icon : "files",
            ref   : '/#/artikel',
            class : ''
          },
          {
            title : "Tambah Artikel",
            icon : "file-earmark-plus",
            ref   : '/#/tambahArtikel',
            class : ''
          },
          {
            title : "PENGATURAN"
          },
          {
            title : "Akun",
            icon : "person",
            ref   : '/#/akun',
            class : ''
          },
        ],

        notification : [
          {
            icon : "journals",
            text : "Jurnal Realtech Berhasil Ditambah"
          }
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
      },
      logOut : function(){
        sessionStorage.clear();
        this.loggedIn = loggedIn();
        validateLoginCredential(this.$router);
      }
    },
    created(){
     console.log(this.$route);
      this.loggedIn = loggedIn();
      validateLoginCredential(this.$router);
      this.account_name = getAccountName();
    }
  }
</script>

<style>

.active{
  background-color: #3C8B69;
  padding:6px;
  border-radius: 5px;
  font-weight: bold;
}

.active-text{
  color:#fff;
}

.-text{
  color:#fff;
}

.lnavbar{
  background-color:#27ae60;
  width:100%;
  height:60px;
  position:absolute;
  z-index:1;
  box-shadow: 0px 7px 21px 0px rgba(50, 50, 50, 0.1);
}

.sidebar{
  height: 100vh;
  width: 250px;
  position: fixed;
  box-shadow: 7px 0px 21px 0px rgba(50, 50, 50, 0.10);
  z-index: 99;
  background-color: #0bab64;
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

.fade-enter-active,
.fade-leave-active {
  transition-duration: 0.3s;
  transition-property: opacity;
  transition-timing-function: ease;
}

.fade-enter,
.fade-leave-active {
  opacity: 0
}

</style>
