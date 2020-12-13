<template>
	<div>
		<div class="container pt-3">
			<h3 class="title mb-2">Laporan Tambah Jurnal</h3>
			<p class="subtitle has-text-gray is-5 mt-0">Kelola daftar jurnal yang akan ditambahkan disini</p>
		</div>
		<Tables :table_data_head="table_data.head" admin="true" :table_data_body="table_data.body"></Tables>
	</div>
</template>

<script type="text/javascript">
	
	import {API_ENDPOINT, adminAccess} from '../functions/universal.js';
	import Tables from './Component/Tables.vue';
	const axios = require('axios');

	export default{
		data(){
			return{
				table_data : [],
			}
		},
		components : {
			Tables
		},

		methods : {
			
			getData : function(){
				var app = this;
				axios.get(API_ENDPOINT + "/admin/admin_getJurnal.php")
					 .then(function(response){
					 	app.table_data = response.data;
					 })
					 .catch(function(error){

					 })
			}

		},


		created(){
			adminAccess(this.$router);
			this.getData();
		}
		
	}
</script>