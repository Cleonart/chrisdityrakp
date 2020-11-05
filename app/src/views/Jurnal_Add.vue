<template>
  <div class="about">
    <h1>Tambahkan Jurnal</h1>

    <!-- Jurnal Publikasi -->
    <p class="mt-3 mb-1">Publikasi Jurnal</p>
  	<b-form-select v-model= "jurnal.publikasi_jurnal" :options="publikasi_jurnal"></b-form-select>

  	<!-- Jurnal Judul -->
  	<p class="mt-3 mb-1">Judul Jurnal</p>
  	<b-form-input placeholder= "Masukkan Judul Jurnal">
  	</b-form-input> 

  	<!-- Jurnal Penulis -->
  	<p class="mt-3 mb-1">Penulis Jurnal</p>
  	<v-select multiple placeholder= "Masukkan Nama Penulis" v-model="jurnal.publikasi_penulis" :options="dosen"/>
  	<p class="mt-1" style="font-size:12px; opacity:0.6">*Pilihlah mulai dari Penulis Pertama</p>

  	<!-- Tanggal Publikasi Jurnal -->
  	<p class="mt-3 mb-1">Tanggal Publikasi Jurnal</p>
  	<vc-date-picker class="inline-block h-full" mode="date" v-model="jurnal.publikasi_tanggal">
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
  	<p class="mt-3 mb-1">Abstract Jurnal</p>
  	<b-form-textarea id="textarea" v-model="jurnal.jurnal_abstract" placeholder="Tambahkan Abstract..." rows="3" max-rows="6">
  	</b-form-textarea>

  	<b-button class="mt-2 mb-1" variant="dark">Simpan</b-button>
  	
  </div>
</template>

<script>
	export default{
		data(){
			return {

				//publikasi_jurnal
				publikasi_jurnal:[
					{value: null, text: 'Pilih Jurnal'},
					{value: 'a', text: 'Jurnal Lasallian'},
					{value: 'b', text: 'Jurnal Ilmiah Realtech'},
					{value: 'c', text: 'Innovative: Jurnal Ilmiah Ekonomi dan Bisnis'},
					{value: 'd', text: 'Jurnal Servanda'}
				], 

				//dosen
				dosen:['Melani Adrian', 'Junaidy Sanger'],

				//tanggal
				publikasi_tanggal: '',
				calendar_state: false,
				context : '',

				//jurnal_ditambahkan
				jurnal: {
					publikasi_jurnal : null,
					publikasi_judul_jurnal : null,
					publikasi_penulis : null,
					publikasi_tanggal : null,
					jurnal_abstract : null,
				}
			}
		},

		methods: {
			onContext(ctx){
				this.context = ctx;
				this.jurnal.publikasi_tanggal = this.publikasi_tanggal;
			},

			openCloseCalendar : function() {
				if(this.calendar_state){
					this.calendar_state = false;
				}
				else{
					this.calendar_state = true
				}
				
			}
		}
	}
</script>