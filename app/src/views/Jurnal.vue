<template>
	<div>
		<div class="container pt-3">

			<h3 class="title mb-2">Daftar Jurnal</h3>
			<p class="subtitle has-text-gray is-5 mt-0">Kelola daftar jurnal disini</p>


			<div class=" mt-2 box is-floating" style="display: flex;background: #E5F5EE;padding-bottom: 5px;border-radius:5px;-webkit-box-shadow: none;">

				<!-- CARI ARTIKEL -->
				<div class="col">
					<p class="control has-icons-left">
			    		<input v-model="jurnal_search" placeholder="Cari Jurnal.." class="input is-rounded">
					    <svg class="icon is-left"><use xlink:href="../assets/bds-icons.min.svg#search-g"></use></svg>
					    <svg class="icon is-right"><use xlink:href="media/bds-icons.min.svg#cross-g"></use></svg>
					</p>
				</div>

				<!-- PILIH JURNAL -->
				<div class="col-3 pl-0" style="margin-left: -5px">
					<p class="control has-icons-right">
						<select class="input ml-2 is-rounded" v-model="jurnal_select">
							<option v-for="option in publikasi_jurnal" :value="option.value">{{option.text}}</option>
						</select>
						<svg class="icon is-right"><use xlink:href="../assets/bds-icons.min.svg#cross-g"></use></svg>
					</p>
				</div>

				<!-- TAMBAH JURNAL -->
				<div>
					<router-link to="/tambahJurnal" style="text-decoration: none;">
						<div class="button is-rounded is-success">
						    <svg class="icon"><use xlink:href="../assets/bds-icons.min.svg#plus-g"></use></svg>
						    <span>Jurnal</span>
						</div>
					</router-link>
				</div>

			</div>
			
			<Tables :table_data_head="table_data.head" :table_data_body="filteredData"></Tables>
		</div>
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