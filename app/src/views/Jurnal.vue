<template>
	<div>
		<div class="container">
			<h3>Daftar Jurnal ({{table_data.body.length}})</h3>
			<p>Kelola daftar jurnal disini</p>
			<div class="row">
				<div class="col mt-3" style="display:flex">
					<b-form-input v-model="jurnal_search" size="md" class="mr-sm-2" placeholder="Cari Jurnal"></b-form-input>
  					<b-form-select v-model="jurnal_select" :options="publikasi_jurnal"></b-form-select>
				</div>
			</div>
		</div>

		<Tables :table_data_head="table_data.head" :table_data_body="filteredData"></Tables>

	</div>
</template>

<script type="text/javascript">
	
	import {API_ENDPOINT} from '../functions/universal.js';
	import Tables from './Component/Tables.vue';
	const axios = require('axios');

	export default{
		data(){
			return{
				table_data : [],
				publikasi_jurnal:[
					{value: null, text: 'Pilih Jurnal'}
				],

				jurnal_search:"",
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
					 	app.table_data = response.data;
					 	app.publikasi_jurnal = response.data.option;
					 })
					 .catch(function(error){

					 })
			}

		},

		computed : {

			filteredData(){
				return this.table_data.body.filter(data => {
					
					if(this.jurnal_select != null){

						if(this.jurnal_select == data[0].title){
							let datas = data[1].title.toLowerCase().includes(this.jurnal_search);
							return datas;
						}
						else{
							return 0;
						}

					}

					let datas = data[1].title.toLowerCase().includes(this.jurnal_search);
					return datas;
				})
			}

		},

		created(){
			this.getData();
		}
		
	}
</script>