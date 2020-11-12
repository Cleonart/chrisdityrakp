<template>
	<div>
		<div class="container">
			<div class="row">
				<div class="col">
					<h3>Laporan Tambah Jurnal</h3>
					<p>Daftar Permintaan Menambahkan Jurnal</p>
				</div>
				<div class="col mt-3" style="display:flex">
				</div>
			</div>
		</div>

		<Tables :table_data_head="table_data.head" :table_data_body="table_data.body"></Tables>

	</div>
</template>

<script type="text/javascript">
	
	import {API_ENDPOINT} from '../functions/universal.js';
	import Tables from './Component/Tables.vue';
	const axios = require('axios');

	export default{
		data(){
			return{
				table_data : {
					
				},
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
			this.getData();
		}
		
	}
</script>