<template>
	<div>

		<div class="container pt-3">
			<div class="row">

				<div class="col-12">
					<h3 class="title mb-2">Tambah Jurnal</h3>
				</div>

				<form  class="col-12 pl-0 pr-0" @submit.prevent="onSubmit">

				  	<!-- Nama Jurnal -->
				  	<div class="col-12 mt-3">
				  		<div class="field">
				  			<label for="jurnal_nama" class="label">Nama Jurnal</label>
				  			<input required id="jurnal_nama" v-model="jurnal.jurnal_nama" class="input" type="text" placeholder="Masukkan Nama Jurnal..">
				  		</div> 
				  	</div>
				  	
				  	<!-- Pengelola Jurnal -->
				  	<div class="col-12 mt-3">
						<div class="field select">
						    <label for="artikel_edisi" class="label">Pilih Institusi</label>
						    <select required v-model="jurnal.institusi_id">
						        <option v-for="option in fakultas" :value="option.value">{{option.text}}</option>
						    </select>
						</div>
					</div>

					<button class="col-12 mb-5 mt-3" style="border:none;background-color: transparent;">
					  	<div>
							<div class="button is-success w-100">
							    <svg class="icon"><use xlink:href="../assets/bds-icons.min.svg#send-g"></use></svg>
							    <span>Tambah Jurnal</span>
							</div>
						</div>
					</button>
				</form>

			</div> 	
		</div>
  </div>
</template>

<script>
	
	import {API_ENDPOINT, startloading, endloading, getAccountId} from '../functions/universal.js';
	const axios = require('axios');

	export default{
		data(){
			return {

				fakultas:[],

				//jurnal_ditambahkan
				jurnal: { 
					jurnal_nama : null,
					institusi_id : null
				},
			}
		},

		methods: {
			getData : function(){
				let app = this;
				let url = API_ENDPOINT + "/issues/add_jurnal_getter.php?id=" + getAccountId();
				startloading(this.$swal);
				axios.get(url)
					.then(function(response){
						console.log(response);
						app.fakultas = response.data;
					 	endloading(app.$swal);
					})
					.catch(function(error){
						app.$swal("Proses Gagal", "Proses mengambil data gagal", "error");
					})
			},

			onSubmit : function(){
				
				let app = this;
				let url = API_ENDPOINT + "/jurnal/add.php";
				let json_data = JSON.stringify(app.jurnal);
				
				this.$swal({
					title : 'Kirim data',
					text  : "Anda yakin ingin mengirim data ini",
					icon  : "question",
					confirmButtonColor: '#2ecc71',
					confirmButtonText: 'Kirim',
					cancelButtonText : 'Batal',
					showCancelButton: true
				})

				.then((result) =>{
					if (result.value) {
						startloading(this.$swal);
						axios.post(url, json_data)
							 .then(function(response){
							 	if(response.data.error_code == "success"){
							 		app.$swal("Proses Berhasil", "Permintaan penambahan jurnal baru berhasil dikirimkan", "success");
							 	}
							 	else if(response.data.error_code == "jurnal_already_exist"){
							 		app.$swal("Proses Gagal", "Jurnal dengan nama yang sama sudah terdaftar", "error");
							 	}
							 	
								console.log(response);
							}).catch(function(error){
								app.$swal("Proses Gagal", "Proses pengiriman data gagal", "error");
						})
					}
				})
			}
		},
		created(){
			this.getData();
		}
	}
</script>