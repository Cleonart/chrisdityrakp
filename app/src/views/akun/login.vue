<template>
	<div style="width: 340px;position: absolute;left: 50%;transform: translateX(-50%);" class="mt-5">
		<img src="../../assets/logo.png" class="mb-3" style="width:45px">
		<p class="title">Login</p>
		<p class="subtitle is-6">Silahkan masuk untuk melakukan pengelolaan data jurnal</p>

		<!-- username -->
		<div class="mt-3" style="width: 290px;">
			<div class="field">
			  	<label class="label">Username</label>
			  	<input v-model="username" class="input" type="text" placeholder="Masukan Username Anda">
			  </div> 
		</div>

		<!-- password -->
		<div class="mt-3" style="width: 290px;">
			<div class="field">
			  	<label class="label">Password</label>
			  	<input v-model="password" class="input" type="password" placeholder="Masukan Password Anda">
			  </div> 
		</div>

		<div @click="login()" class="button mt-3 is-success">
		    <span>Masuk</span>
		</div>

	</div>
</template>

<script type="text/javascript">

	import {API_ENDPOINT, startloading, endloading} from '../../functions/universal.js';
	const axios = require('axios');
	var md5 = require('md5');

	export default{
		data(){
			return{
				username : "",
				password : ""
			}
		},
		methods : {
			
			login : function(){
				var app = this;
				const json_data = JSON.stringify({username : app.username, password : md5(app.password)});
				startloading(this.$swal);
				axios.post(API_ENDPOINT + "/akun/login.php", json_data)
					.then(function(response){
						console.log(response);
						endloading(app.$swal);
						if(response.data.error_code == 'success'){
							app.$swal("Berhasil Login", "Sedang diarahkan ke halaman beranda", "success");
							sessionStorage.setItem("id_credential", md5(app.username + app.password));
							sessionStorage.setItem("session", response.data.session);
							sessionStorage.setItem("name_credential", response.data.pengguna_nama);
							sessionStorage.setItem("stats",  response.data.stats);
							app.$router.replace("/");
							//alert(response.data.session);
							location.reload();
						}
						else{
							app.$swal("Gagal Login", "Username dan Password yang anda<br/>masukan tidak cocok", "error");
						}
						
					})
					.catch(function(error){
						app.$swal("Permintaan Gagal", "Mohon periksa internet anda", "error");
					})
			}

		}
	}
</script>