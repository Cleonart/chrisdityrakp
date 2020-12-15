<template>
	<div>
		<div class="container pt-3">
			<h3 class="title mb-2">Laporan Tambah Jurnal</h3>
			<p class="subtitle has-text-gray is-5 mt-0">Kelola daftar jurnal yang akan ditambahkan disini</p>
		</div>
		<Tables :table_data_head="table_data.head" admin="true" :table_data_body="table_data.body">
			<template v-slot:default="slotProps">

				<!-- terima -->
				<span @click="changeState(slotProps.body[0].title, 1)" class="mr-2" :id="'open' + slotProps.body[0].title">
					<svg class="icon is-right has-fill-success"><use xlink:href="../assets/bds-icons.min.svg#check-bold-g"></use></svg>
				</span>

				<!-- tolak -->
			  	<span @click="changeState(slotProps.body[0].title, 0)" class="mr-2" :id="'close' + slotProps.body[0].title">
			  		<svg class="icon is-right has-fill-danger"><use xlink:href="../assets/bds-icons.min.svg#cross-bold-g"></use></svg>
			  	</span>

		  		<b-tooltip :target="'open' + slotProps.body[0].title">Terima</b-tooltip>
		  		<b-tooltip :target="'close' + slotProps.body[0].title">Tolak</b-tooltip>
		  	</template>
		</Tables>
	</div>
</template>

<script type="text/javascript">
	
	import {API_ENDPOINT, adminAccess, startloading, endloading} from '../functions/universal.js';
	import Tables from './Component/Tables.vue';
	const axios = require('axios');

	export default{
		data(){
			return{
				table_data : [],
			}
		},
		components : {
			Tables
		},

		methods : {
			
			changeState : function(id, status){
				var app = this;
				startloading(app.$swal);
				let button_text = "Terima";
				let button_color = "#2ecc71";

				if(status == 0){
					button_text = "Tolak";
					button_color = "#e74c3c";
				}

				this.$swal({
					title : 'Verfikasi data jurnal',
					text  : "Anda yakin akan melakukan verifikasi jurnal ini?",
					icon  : "question",
					confirmButtonColor: button_color,
					confirmButtonText: button_text,
					cancelButtonText : 'Batal',
					showCancelButton: true
				})

				.then((result) => {
					if(result.value){
						axios.get(API_ENDPOINT + "/admin/admin_actJurnal.php?id=" + id + "&status=" + status)
						     .then(function(response){
						     	app.$swal("Proses Berhasil", "Perubahan status jurnal berhasil dilakukan", "success");
						     	console.log(response.data);
						     	app.$router.replace("/jurnal");
						     })
						     .catch(function(error){
						     	app.$swal("Proses Gagal", "Perubahan status jurnal gagal dilakukan", "error");
						     })
					}
				})

				
			},
			
			getData : function(){
				var app = this;
				startloading(this.$swal);
				axios.get(API_ENDPOINT + "/admin/admin_getJurnal.php")
					 .then(function(response){
					 	console.log(response);
					 	endloading(app.$swal);
					 	app.table_data = response.data;
					 	endloading(app.$swal);
					 })
					 .catch(function(error){
					 	endloading(app.$swal);
					 })
			}

		},

		created(){
			adminAccess(this.$router);
			this.getData();
		}
		
	}
</script>