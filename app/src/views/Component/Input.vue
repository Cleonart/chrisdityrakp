<template>
	
	<div class="container pt-3" style="margin-bottom: 90px;">
		<div class="row">
			<h3 class="col-12 title mb-4">{{title}}</h3>
			<h3 class="col-12 subtitle mb-4 is-5">{{subtitle}}</h3>
			<div class="col-12 mb-2" v-for="(input,index) in data.body">

				<!-- text component -->
			  	<div class="field" v-if="input.type == 'text'">
			  		<label :for="index" class="label">{{input.label}}</label>
			  		<input :id="index" v-model="input.title" class="input" type="text" :placeholder="input.placeholder">
			  	</div>

			  	<!-- select -->
				<div class="field select" v-else-if="input.type == 'select'"> 
					<label for="artikel_edisi" class="label">{{input.label}}</label>
					<select v-model="input.title" >
						<option v-for="option in input.select" :value="option.value">{{option.text}}</option>
					</select>
				</div>

			</div>

			<!-- simpan -->
			<div class="col-12 mt-2" style="display: flex;">

				<div class="button is-success mr-2" @click="addData()">
				    <svg class="icon"><use xlink:href="../../assets/bds-icons.min.svg#send-g"></use></svg>
				    <span>Simpan</span>
				</div>

				<div class="button is-danger" @click="back()">
				   <span>Batal</span>
				</div>

			</div>

		</div>
	</div>

</template>

<script type="text/javascript">

	import {API_ENDPOINT, startloading, endloading} from '../../functions/universal.js';
	const axios = require('axios');

	export default{
		props : ['id','title', 'subtitle', 'link_to_get', 'link_to_post', 'landing'],
		data(){
			return{
				data : {}
			}
		},

		methods : {

			getData : function(){
				var app = this;
				startloading(this.$swal);

				axios.get(API_ENDPOINT + this.link_to_get)
					.then(function(response){
						console.log(response);
						app.data = response.data;
						endloading(app.$swal);
					})
					.catch(function(error){
						console.log(error);
					})
			},

			addData : function() {
				
				var app = this;
				startloading(this.$swal);

				// reconstruct json
				let reconstruct_json = [];
				for(let i = 0; i < app.data.body.length; i++){
					reconstruct_json[i] = app.data.body[i].title;
				}
				const json_data = JSON.stringify(reconstruct_json);

				this.$swal({
					title : 'Kirim data',
					text  : "Anda yakin ingin mengirim data ini",
					icon  : "question",
					confirmButtonColor: '#2ecc71',
					confirmButtonText: 'Kirim',
					cancelButtonText : 'Batal',
					showCancelButton: true
				})

				.then((result) => {
					if (result.value) {
						axios.post(API_ENDPOINT + this.link_to_post, json_data)
							 .then(function(response){
					 			console.log(response.data);

					 			if (response.data.error_code == 'username_exist') {
					 				app.$swal("Username sudah digunakan", "Silahkan pilih username lain untuk melanjutkan", 'error');
					 			}

							 	else if (response.data.error_code == 'data_exist') {
							 		app.$swal("Proses Gagal", "Data sudah terdaftar sebelumnya", 'error');
							 	}

							 	else if(response.data.error_code == 'success'){
								 	app.$swal({
								 		title : "Proses Berhasil",
								 		text  : "Penyimpanan data berhasil dilakukan",
								 		confirmButtonText: `Ok`,
								 		icon : 'success'
								 	}).then((result) => {
								 		app.$router.replace(app.landing);
								 	});
								}
					 		})
							 .catch(function(error){
							 	app.$swal("Gagal", "Penyimpanan data gagal", "error");
							 })
					}
				})

			},

			back : function(){
				this.$router.replace(this.landing);
			}
		},

		created(){
			this.getData();
		}
	}

</script>