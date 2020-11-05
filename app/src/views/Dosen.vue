<template>
	<div>
		<div class="container">
			<div class="row">
				<div class="col">
					<h3>Daftar Nama Dosen</h3>
				</div>
				<div class="col mt-1" style="display:flex">
					<b-form-input v-model="dosen_search" size="md" class="mr-sm-2" placeholder="Cari Dosen"></b-form-input>
  					<b-form-select v-model="dosen_select" :options="fakultas"></b-form-select>
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
				fakultas:[
					{value: null, text: 'Pilih Fakultas'},
					{value: 'a', text: 'Fakultas Teknik'},
					{value: 'b', text: 'Fakultas Keperawatan'},
					{value: 'c', text: 'Fakultas Ekonomi'},
					{value: 'd', text: 'Fakultas Hukum'},
					{value: 'd', text: 'Fakultas Pertanian'},
					{value: 'd', text: 'Fakultas Pariwisata'},
					{value: 'd', text: 'Fakultas Pendidikan Guru Sekolah Dasar'}
					],

				dosen_search:null,
				dosen_select:null
			}
		},
		components : {
			Tables
		},
		methods : {
			
			getData : function(){
				var app = this;
				axios.get(API_ENDPOINT + "/dosen/get.php")
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