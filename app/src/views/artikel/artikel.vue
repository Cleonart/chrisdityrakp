<template>
	<div>
		<div class="container">
			<div class="row">
				<div class="col">
					<h3>Daftar Artikel</h3>
					<p>Kelola daftar artikel disini</p>
				</div>
				<div class="col mt-3" style="display:flex">
					<b-form-input v-model="artikel_search" size="md" class="mr-sm-2" placeholder="Cari Artikel"></b-form-input>
				</div>
			</div>
		</div>

		<Tables :table_data="table_data"></Tables>

	</div>
</template>

<script type="text/javascript">
	
	import {API_ENDPOINT} from '../../functions/universal.js';
	import Tables from '../Component/Tables.vue';
	const axios = require('axios');

	export default{
		data(){
			return{
				table_data : {
					
				},

				jurnal_search:null
			}
		},
		components : {
			Tables
		},
		methods : {
			
			getData : function(){
				var app = this;
				axios.get(API_ENDPOINT + "/artikel/get.php")
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