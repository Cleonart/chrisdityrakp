<template>
	<div>

		<div class="container pt-3">
			<div class="row">
				<div class="col-12">
					<h3 class="title mb-2">Tambah Edisi</h3>
				</div>


			  	<!-- Nama Jurnal -->
			  	<div class="col-12 mt-3">
					<div class="field select">
					    <label for="artikel_edisi" class="label">Pilih Jurnal</label>
					    <select v-model="jurnal_select">
					        <option v-for="option in publikasi_jurnal" :value="option.value">{{option.text}}</option>
					    </select>
					</div>
				</div>

				<!-- Edisi Volume -->
			  	<div class="col-12 mt-3">
			  		<div class="field">
			  			<label for="edisi_volume" class="label">Volume Edisi</label>
			  			<input id="edisi_volume" class="input" type="text" placeholder="Masukkan Volume Edisi..">
			  		</div> 
			  	</div>

			  	<!-- Edisi Nomor -->
			  	<div class="col pr-0 mt-3">
					<div class="field">
					    <label for="edisi_nomor" class="label">Nomor Edisi</label>
					    <input id="edisi_nomor" class="input" type="text" placeholder="Masukkan Nomor Edisi..">
					</div>
				</div>

				<!-- Edisi Tahun -->
				<div class="col mt-3">
					<div class="field">
					    <label for="edisi_tahun" class="label">Tahun Edisi</label>
					    <input id="edisi_tahun" class="input" type="text" placeholder="Masukkan Tahun Edisi..">
					</div>
				</div>

			  	<div class="col-12 mb-5 mt-3">
					<div class="button is-success w-100">
					    <svg class="icon"><use xlink:href="../assets/bds-icons.min.svg#send-g"></use></svg>
					    <span>Tambah Edisi</span>
					</div>
				</div>

			</div> 	
		</div>
  </div>
</template>

<script>

	import {API_ENDPOINT, validateLoginCredential} from '../functions/universal.js';
	const axios = require('axios');

	export default{
		data(){
			return {

				publikasi_jurnal:[
					{value: null, text: 'Pilih Jurnal'}
				],

				jurnal_select : null
			}
		},

		methods: {
			getData : function(){
				var app = this;
				axios.get(API_ENDPOINT + "/jurnal/get.php")
					 .then(function(response){
					 	app.publikasi_jurnal = response.data.option;
					 })
					 .catch(function(error){

					 })
			}
		},

		computed : {

		},

		created(){
			validateLoginCredential(this.$router);
			this.getData();
		}
	}
</script>