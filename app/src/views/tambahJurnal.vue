<template>
	<div>

		<div class="container pt-3">
			<div class="row">

				<div class="col-12">
					<h3 class="title mb-2">Tambah Jurnal</h3>
				</div>

			  	<!-- Nama Jurnal -->
			  	<div class="col-12 mt-3">
			  		<div class="field">
			  			<label for="jurnal_nama" class="label">Nama Jurnal</label>
			  			<input id="jurnal_nama" class="input" type="text" placeholder="Masukkan Nama Jurnal..">
			  		</div> 
			  	</div>
			  	
			  	<!-- Pengelola Jurnal -->
			  	<div class="col-12 mt-3">
					<div class="field select">
					    <label for="artikel_edisi" class="label">Pilih Institusi</label>
					    <select v-model="institution_select">
					        <option v-for="option in fakultas" :value="option.value">{{option.text}}</option>
					    </select>
					</div>
				</div>

			  	<div class="col-12 mb-5 mt-3">
					<div class="button is-success w-100">
					    <svg class="icon"><use xlink:href="../assets/bds-icons.min.svg#send-g"></use></svg>
					    <span>Tambah Jurnal</span>
					</div>
				</div>

			</div> 	
		</div>
  </div>
</template>

<script>
	export default{
		data(){
			return {

				fakultas:[
					{value: null, text: 'Pilih Fakultas'},
					{value: 'a', text: 'Fakultas Teknik'},
					{value: 'b', text: 'Fakultas Keperawatan'},
					{value: 'c', text: 'Fakultas Ekonomi'},
					{value: 'd', text: 'Fakultas Hukum'},
					{value: 'd', text: 'Fakultas Pertanian'},
					{value: 'd', text: 'Fakultas Pariwisata'},
					{value: 'd', text: 'Fakultas Pendidikan Guru Sekolah Dasar'}
				],

				//jurnal_ditambahkan
				jurnal: { 
					nama : null,
					institusi : null
				},

				institution_select : null
			}
		},

		methods: {

		}
	}
</script>