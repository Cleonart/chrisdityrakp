<template>
	<div>
		<h3>Tambah Artikel</h3>
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