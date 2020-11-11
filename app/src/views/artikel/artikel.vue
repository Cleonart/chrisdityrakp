<template>
	<div>
		<div class="container">
			<div class="row">
				<div class="col">
					<h3>Daftar Artikel</h3>
					<p>Kelola daftar artikel disini</p>
				</div>
				<div class="col-7 mt-3" style="display:flex">
					<b-form-input v-model="artikel_search" size="md" class="mr-2" placeholder="Cari Artikel"></b-form-input>
					<b-form-select v-model="jurnal_select" class="mr-2"  :options="jurnal_option"></b-form-select>
					<transition name="fade" mode="out-in">
  						<b-form-select v-if="jurnal_select != null" v-model="jurnal_edisi_select"  :options="editionJurnal"></b-form-select>
					</transition>
				</div>
				</div>
			</div>

		<Tables :table_data_head="table_data.head" :table_data_body="table_data.body"></Tables>

	</div>
</template>

<script type="text/javascript">
	
	import {API_ENDPOINT} from '../../functions/universal.js';
	import Tables from '../Component/Tables.vue';
	const axios = require('axios');

	export default{
		data(){
			return{
				table_data : {},
				jurnal_edisi : [{value : null, text : "Pilih Edisi"}],
				jurnal_option : [],
				artikel_search : '',
				jurnal_select : null,
				jurnal_edisi_select : null,
				jurnal_search:null
			}
		},

		components : {
			Tables
		},

		watch : {

			jurnal_select : function(){

			}

		},

		computed : {
			
			editionJurnal(){
				return this.jurnal_edisi.filter(data => {
					if(data.jurnal_id == this.jurnal_select || data.value == null){
						return data;
					}
				});
			},

			filteredData(){

			}

		},

		methods : {
			
			getData : function(){
				var app = this;
				axios.get(API_ENDPOINT + "/artikel/get.php")
					 .then(function(response){
					 	console.log(response.data);
					 	app.table_data = response.data
					 	app.jurnal_option = response.data.option;
					 	app.jurnal_edisi = response.data.edition;
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

<style type="text/css">
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