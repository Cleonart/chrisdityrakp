<template>
	<div class="container pt-3">
		<div class="row">
			<div class="col-10">
				<h3 class="title mb-2">Daftar Akun</h3>
				<p class="subtitle has-text-gray is-5 mt-0">Kelola akun disini</p>
			</div>
			<div class="col-2 button is-success mt-2" @click="navigate()">
			    <svg class="icon"><use xlink:href="../../assets/bds-icons.min.svg#plus-g"></use></svg>
			    <span>Tambah</span>
			</div>
		</div>
		<Tables :table_data_head="data.head" :table_data_body="data.body" >
			 	<template v-slot:default="slotProps">
			 		
			 		<router-link :to="'/akun/' + slotProps.body[0].title" style="text-decoration: none">
				 		<span class="mr-2" :id="'open' + slotProps.body[0].title">
			  				<svg class="icon is-right has-fill-primary"><use xlink:href="../../assets/bds-icons.min.svg#edit-g"></use></svg>
			  			</span>
			  		</router-link>
		  			
		  			<b-tooltip :target="'open' + slotProps.body[0].title">Edit</b-tooltip>
			  	</template>
			<p name="aksi">tes</p>
		</Tables>
	</div>
</template>

<script type="text/javascript">

	import {API_ENDPOINT, startloading, endloading} from '../../functions/universal.js';
	import Tables from '../Component/Tables';
	const axios = require('axios');

	export default{
		data(){
			return{
				data : []
			}
		},
		components : {
			Tables
		},
		methods : {

			getData : function () {
				var app = this;
				startloading(this.$swal);
				axios.get(API_ENDPOINT + "/akun/get.php")
					.then(function(response){
						console.log(response);
						app.data = response.data;
						endloading(app.$swal);
					})
					.catch(function(error){

				})
			},

			navigate : function(){
				this.$router.push("/akun/tambah");
			}
		},
		created(){
			this.getData();
		}
	}
</script>