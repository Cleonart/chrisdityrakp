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
					    <select id="artikel_jurnal" v-model="artikel.jurnal_select">
					        <option v-for="item in list.jurnal" :value="item.value">{{item.text}}</option>
					    </select>
					</div>
				</div>

				<div class="col mt-3">
					<div class="field select">
					    <label for="artikel_edisi" class="label">Pilih Edisi</label>
					    <select id="artikel_edisi" v-model="artikel.edisi_select">
					        <option v-for="item in editionJurnal" :value="item.value">{{item.text}}</option>
					    </select>
					</div>
				</div>

				<div class="col-12 mt-3">
					<div class="field">
				        <label for="artikel_judul" class="label">Judul Artikel</label>
				        <input id="artikel_judul" v-model="artikel.judul" class="input" type="text" placeholder="Masukkan judul artikel..">
				    </div>
				</div>

				<div class="col-12 mt-3">
				   	<v-select taggable multiple push-tags placeholder= "Masukkan Nama Penulis" style="border:none" v-model="artikel.penulis"/>
				</div>

				<div class="col-12 mt-3">
					<div class="field">
				        <label class="label">Keyword Artikel</label>
				        <input v-model="artikel.keyword" class="input" type="text" placeholder="Masukkan keyword artikel..">
				    </div>
				</div>
				<div class="col-12 mt-3">
					<div class="field" style="border:1px solid rgba(26,14,35,.125);border-radius: 5px">
				        <label for="artikel_judul" class="label">Tanggal Publikasi Artikel</label>
				        <vc-date-picker class="inline-block h-full" mode="date" v-model="artikel.publikasi_tanggal">
						    <template v-slot="{ inputValue, togglePopover }">
						      <div class="flex items-center">
						        <input
						          style="width: 100%;padding-bottom: 10px; border:none;padding-left: 15px;margin-top: 35px;border-radius: 5px;"
						          :value="artikel.publikasi_tanggal"
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
				        <textarea id="textfield" class="textarea" v-model="artikel.abstrak" placeholder="Abstrak..."></textarea>
				    </div>
				</div>

				<div class="col-12">
					<file-pond
						:server="'http://127.0.0.1/jurnal/pond/'"
						class="mt-3 mb-1"
			        	ref="file" 
			        	instantUpload="false"
			        	label-idle="Letakan file disini..."
			        	:files="myFiles"/>
				</div>

				<div class="col-12 mb-5">
					<div class="button is-success w-100" @click="addArtikel()">
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

	import {API_ENDPOINT, getAccountId, startloading, endloading} from '../../functions/universal.js';
	import vueFilePond from 'vue-filepond';
	import 'filepond/dist/filepond.min.css';

	// Create component
	const FilePond = vueFilePond();
	const axios = require('axios');

	export default{
		data(){
			return{

				myFiles : [],

				list : {
					jurnal : [],
					edisi : []
				},

				//tanggal
				calendar_state: false,
				context : '',

				artikel: {
					id                : "",
					judul 		      : null,
					jurnal_select     : null,
					edisi_select      : null,
					penulis           : null,
					keyword           : null,
					publikasi_tanggal : null,
					abstrak           : null,
					filepath          : null,
				}

			}
		},
		methods : {

			getData : function(){
				var app = this;
				let url = API_ENDPOINT + "/issues/add_artikel_getter.php?id=" + getAccountId();
				startloading(this.$swal);
				axios.get(url)
					.then(function(response){
						endloading(app.$swal);
						console.log(response.data);
						app.list.jurnal = response.data.jurnal;
						app.list.edisi = response.data.edisi;
					})
					.catch(function(error){

					})
			},

			addArtikel : function () {
				//
				this.formsCheck();
				//endloading(this.$swal);
			},

			uploadArtikel : function(){
				var app = this;
				const json_data = JSON.stringify(app.artikel);
				let url = API_ENDPOINT + "/artikel/add_update.php";
				axios.post(url, json_data)
					.then(function(response){
						endloading(app.$swal);
						app.$swal("Proses Berhasil", "Penambahan data berhasil dilakukan", "success");
						console.log(response);
					})
					.catch(function(error){

					})
			},

			formsCheck : function(){
				var app = this;
				this.artikel.filepath = this.$refs.file.getFile();

				if( this.artikel.judul != null &&
					this.artikel.jurnal_select != null &&
					this.artikel.edisi_select != null &&
					this.artikel.penulis != null &&
					this.artikel.keyword != null &&
					this.artikel.publikasi_tanggal != null &&
					this.artikel.abstrak != null &&
					this.artikel.filepath != null){

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
						if(result.value){
							startloading(this.$swal);
							this.$refs.file.processFile()
								.then(function(response){
									let server_id = app.$refs.file.getFile().serverId;
									let filename  = app.$refs.file.getFile().filename;
									app.artikel.filepath = "/pond/tmp/" + server_id + "/" + filename;	
									app.uploadArtikel();
								})
								.catch(function(error){

								})
						}
					});
				}
				else{
					alert("Silahkan lengkapi semua form yang tersedia");
				}
			}
		},
		computed : {
			editionJurnal(){
				return this.list.edisi.filter(data => {
					if(data.jurnal_id == this.artikel.jurnal_select || data.value == null){
						return data;
					}
				});
			},
		},
		components : {
			FilePond
		},
		created(){
			this.getData();
		}
	}

</script>