<template>
	<div>
		<div class="container">

			<h3 class="title mb-2">Daftar Artikel</h3>
			<p class="subtitle has-text-gray is-5 mt-0">Kelola daftar jurnal artikel disini</p>

			 <hr class="is-visible is-soft">

			<div class="row mt-2">

				<!-- PILIH JURNAL -->
				<div class="col-2 pl-0">
					<p class="control has-icons-right">
						<select class="input ml-2 is-rounded" v-model="jurnal_select">
							<option v-for="option in jurnal_option" :value="option.value">{{option.text}}</option>
						</select>
						<svg class="icon is-right"><use xlink:href="../../assets/bds-icons.min.svg#cross-g"></use></svg>
					</p>
				</div>

				<!-- PILIH EDISI -->
				<div class="col-3 pl-0">
					<p class="control has-icons-right">
						<select class="input ml-2 is-rounded" v-model="jurnal_edisi_select">
							<option v-for="option in editionJurnal" :value="option.value">{{option.text}}</option>
						</select>
						<svg class="icon is-right"><use xlink:href="../../assets/bds-icons.min.svg#cross-g"></use></svg>
					</p>
				</div>

				<div class="col-1"></div>

				<div class="col">
					<p class="control has-icons-left">
			    		<input v-model="artikel_search" placeholder="Cari Artikel.." class="input is-rounded">
					    <svg class="icon is-left"><use xlink:href="../../assets/bds-icons.min.svg#search-g"></use></svg>
					    <svg class="icon is-right"><use xlink:href="media/bds-icons.min.svg#cross-g"></use></svg>
					</p>
				</div>

				<div>
					<div class="button is-rounded is-success">
					    <svg class="icon"><use xlink:href="../../assets/bds-icons.min.svg#plus-g"></use></svg>
					    <span>Artikel</span>
					</div>
				</div>

			</div>
			
			<Tables :table_data_head="table_data.head" :table_data_body="filteredData"></Tables>
		</div>
	</div>
</template>

<style type="text/css">
	@import '../../../node_modules/biings-ds/build/bds.css';
</style>

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
				return this.table_data.body.filter(data => {
					if(this.jurnal_select == null){
						return data;
					}
					else{
						if(this.jurnal_edisi_select != null){
							if(this.jurnal_edisi_select == data[1].title){
								return data;
							}
						}
						else{
							return data;
						}
					}
				})
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