<template>
	<div>
		<h3>Tambah Artikel</h3>
		<b-form-group	id="input-group-1"
        				label="Nama Jurnal"
        				label-for="input-1"
        				description="Silahkan memasukkan nama jurnal usulan">
        	<b-form-input 	id="input-1"
        				    type="text"
          					required
          					placeholder="Cth. RealTech"></b-form-input>
        </b-form-group>

		<file-pond
        	name="test"
        	ref="pond"
        	label-idle="Letakan file disini..."/>
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

			}
		},
		components : {
			FilePond
		}
	}

</script>