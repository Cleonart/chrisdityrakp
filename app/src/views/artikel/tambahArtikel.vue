<template>
	<div>
		
		<div class="container pt-3">
			<div class="row">

				<div class="col-12">
					<h3 class="title mb-2">Tambah Artikel</h3>
				</div>

				<div class="col pr-0 mt-3">
					<div class="field select">
					    <label for="artikel_jurnal" class="label">Pilih Jurnal</label>
					    <select id="artikel_jurnal">
					        <option value="1">Option 1</option>
					        <option value="2">Option 2</option>
					        <option value="3">Option 3</option>
					    </select>
					</div>
				</div>

				<div class="col mt-3">
					<div class="field select">
					    <label for="artikel_edisi" class="label">Pilih Edisi</label>
					    <select id="artikel_edisi">
					        <option value="1">Option 1</option>
					        <option value="2">Option 2</option>
					        <option value="3">Option 3</option>
					    </select>
					</div>
				</div>

				<div class="col-12 mt-3">
					<div class="field">
				        <label for="artikel_judul" class="label">Judul Artikel</label>
				        <input id="artikel_judul" class="input" type="text" placeholder="Masukkan judul artikel..">
				    </div>
				</div>

				<div class="col-12 mt-3">
				   	<v-select taggable multiple push-tags placeholder= "Masukkan Nama Penulis" style="border:none" v-model="artikel.penulis"/>
				</div>

				<div class="col-12 mt-3">
					<div class="field" style="border:1px solid rgba(26,14,35,.125);border-radius: 5px">
				        <label for="artikel_judul" class="label">Tanggal Publikasi Artikel</label>
				        <vc-date-picker class="inline-block h-full" mode="date" v-model="artikel.publikasi_tanggal">
						    <template v-slot="{ inputValue, togglePopover }">
						      <div class="flex items-center">
						        <input
						          style="width: 100%;padding-bottom: 10px; border:none;padding-left: 15px;margin-top: 35px;border-radius: 5px;"
						          :value="inputValue"
						          placeholder="Pilih tanggal"
						          @click="togglePopover({ placement: 'auto-start' })"
						          readonly
						        />
						      </div>
						    </template>
					  	</vc-date-picker>
				    </div>
				</div>

				<div class="col-12 mt-3">
					<div class="field">
				    <label for="textfield" class="label">Abstrak</label>
				        <textarea id="textfield" class="textarea" placeholder="Abstrak..."></textarea>
				    </div>
				</div>

				<div class="col-12">
					<file-pond
						class="mt-3 mb-1"
			        	name="test"
			        	ref="pond"
			        	label-idle="Letakan file disini..."/>
				</div>

				<div class="col-12 mb-5">
					<div class="button is-success w-100">
					    <svg class="icon"><use xlink:href="../../assets/bds-icons.min.svg#send-g"></use></svg>
					    <span>Tambah Artikel</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</template>
<style type="text/css">
	.vs__dropdown-toggle{
		border:none;
	}
</style>
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
					penulis : null,
					publikasi_tanggal : null,
					abstrak : null
				}

			}
		},
		components : {
			FilePond
		}
	}

</script>