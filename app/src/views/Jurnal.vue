<template>
	<div>
		<div class="container">
			<div class="row">
				<div class="col">
					<h3>Daftar Jurnal</h3>
					<p>Kelola daftar jurnal disini</p>
				</div>
				<div class="col mt-3" style="display:flex">
					<b-form-input v-model="jurnal_search" size="md" class="mr-sm-2" placeholder="Cari Jurnal"></b-form-input>
  					<b-form-select v-model="jurnal_select" :options="publikasi_jurnal"></b-form-select>
				</div>
			</div>
		</div>

		<Tables :table_data="table_data"></Tables>

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
				publikasi_jurnal:[
					{value: null, text: 'Pilih Jurnal'},
					{value: 'a', text: 'Jurnal Lasallian'},
					{value: 'b', text: 'Jurnal Ilmiah Realtech'},
					{value: 'c', text: 'Innovative: Jurnal Ilmiah Ekonomi dan Bisnis'},
					{value: 'd', text: 'Jurnal Servanda'}
					],

				jurnal_search:null,
				jurnal_select:null
			}
		},
		components : {
			Tables
		},
		methods : {
			
			getData : function(){
				var app = this;
				axios.get(API_ENDPOINT + "/jurnal/get.php")
					 .then(function(response){
					 	app.table_data = response.data
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