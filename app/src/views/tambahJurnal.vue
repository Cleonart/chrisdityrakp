<template>
  <div class="about">
    <h1>Tambahkan Jurnal</h1>

  	<!-- Nama Jurnal -->
  	<p class="mt-3 mb-1">Nama Jurnal</p>
  	<b-form-input placeholder= "Masukkan Nama Jurnal" v-model="jurnal.nama">
  	</b-form-input> 

  	<!-- Pengelola Jurnal -->
  	<p class="mt-3 mb-1">Institusi</p>
	<b-form-select v-model= "jurnal.institusi" :options="fakultas"></b-form-select>

  	<b-button class="mt-3 mb-1" variant="success">Kirim Permintaan</b-button>
  	
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
				}
			}
		},

		methods: {

		}
	}
</script>