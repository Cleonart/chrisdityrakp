<template>
	<div>
		<h3>Tambah Artikel</h3>

		<!-- Artikel Publikasi Jurnal -->
	    <p class="mt-3 mb-1">Jurnal</p>
	  	<b-form-select v-model= "artikel.publikasi_jurnal" :options="publikasi_jurnal"></b-form-select>

		<b-form-group	class="mt-3 mb-1"
						id="input-group-1"
        				label="Judul Artikel"
        				label-for="input-1">

        	<b-form-input 	id="input-1"
        				    type="text"
          					required
          					placeholder="Judul Artikel yang Dipublish"></b-form-input>
        </b-form-group>

        <!-- Author -->
	  	<p class="mt-3 mb-1">Author</p>
	  	<v-select taggable multiple push-tags placeholder= "Masukkan Nama Author" v-model="artikel.author"/>
	  	<p class="mt-1" style="font-size:12px; opacity:0.6">*Tulislah mulai dari Author Pertama</p>

	  	<!-- Tanggal Publikasi Artikel -->
	  	<p class="mt-3 mb-1">Tanggal Publikasi Artikel</p>
	  	<vc-date-picker class="inline-block h-full" mode="date" v-model="artikel.publikasi_tanggal">
		    <template v-slot="{ inputValue, togglePopover }">
		      <div class="flex items-center">
		        <input
		          :value="inputValue"
		          placeholder="Pilih tanggal"
		          class="bg-white form-control text-gray-700 w-full py-1 px-2 appearance-none border rounded-r focus:outline-none focus:border-blue-500" @click="togglePopover({ placement: 'auto-start' })"
		          readonly
		        />
		      </div>
		    </template>
	  	</vc-date-picker>

	  	<!-- Abstract -->
	  	<p class="mt-3 mb-1">Abstract</p>
	  	<b-form-textarea id="textarea" v-model="artikel.abstract" placeholder="Tambahkan Abstract..." rows="3" max-rows="6">
	  	</b-form-textarea>

		<file-pond
			class="mt-3 mb-1"
        	name="test"
        	ref="pond"
        	label-idle="Letakan file disini..."/>

        <b-button class="mt-2 mb-1" variant="success">Tambah Artikel</b-button>

	</div>
</template>

<script>
	
	import vueFilePond from 'vue-filepond';
	import 'filepond/dist/filepond.min.css';
	
	// Create component
	const FilePond = vueFilePond();


	export default{
		data(){
			return{

				publikasi_jurnal:[
					{value: null, text: 'Pilih Jurnal'},
					{value: 'a', text: 'Jurnal Lasallian'},
					{value: 'b', text: 'Jurnal Ilmiah Realtech'},
					{value: 'c', text: 'Innovative: Jurnal Ilmiah Ekonomi dan Bisnis'},
					{value: 'd', text: 'Jurnal Servanda'}
				],

				//tanggal
				publikasi_tanggal: '',
				calendar_state: false,
				context : '',

				artikel: {
					publikasi_jurnal : null,
					author : null,
					publikasi_tanggal : null,
					abstract : null
				}

			}
		},
		components : {
			FilePond
		}
	}

</script>