<template>
	
	<div class="container pt-3">

		<div class="row">
			<h3 class="col-12 title mb-4">Pengaturan Akun</h3>
			<h3 class="col-12 subtitle mb-4 is-5">Lakukan pengaturan akun disini</h3>

			<div class="col-3 mr-0 pr-0">
			  	<div class="field">
			  		<label for="jurnal_nama" class="label">Nama Lengkap</label>
			  		<input id="jurnal_nama" class="input" type="text" placeholder="Masukkan Nama Pengguna">
			  	</div> 
			</div>

			<div class="col-3 pr-0">
			  	<div class="field">
			  		<label for="jurnal_nama" class="label">Username</label>
			  		<input id="jurnal_nama" class="input" type="text" placeholder="Masukkan Nama Pengguna">
			  	</div> 
			</div>

			<div class="col-3 pr-0">
			  	<div class="field">
			  		<label for="jurnal_nama" class="label">Password</label>
			  		<input id="jurnal_nama" class="input" type="text" placeholder="Password Pengguna">
			  	</div> 
			</div>

			<div class="col-3 pr-0">
					<div class="button is-success w-100">
					    <svg class="icon"><use xlink:href="../assets/bds-icons.min.svg#send-g"></use></svg>
					    <span>Tambah Akun</span>
					</div>
				</div>

			<Tables :table_data_head="table_data.head" :table_data_body="table_data.body"></Tables>

		</div>
	
	</div>

</template>

<script type="text/javascript">

	import Tables from './Component/Tables.vue';

	export default{
		data(){
			return{
				table_data : []
			}
		},
		methods : {
			
			getAccounts : function(){
				
			},

			addAccounts : function() {
				
			}

		}
	}

</script>