<template>
	
	<div class="container pt-3" style="margin-bottom: 90px;">
		<div class="row">
			<h3 class="col-12 title mb-4">{{title}}</h3>
			<h3 class="col-12 subtitle mb-4 is-5">{{subtitle}}</h3>

			<div class="col-12 mb-2" v-for="(input,index) in data.body">

				<!-- text component -->
			  	<div class="field" v-if="input.type == 'text'">
			  		<label :for="index" class="label">{{input.label}}</label>
			  		<input :id="index" v-model="input.title" class="input" type="text" :placeholder="input.placeholder">
			  	</div>

			  	<!-- select -->
				<div class="field select" v-else-if="input.type == 'select'"> 
					<label for="artikel_edisi" class="label">{{input.label}}</label>
					<select v-model="input.title">
						<option v-for="option in input.select" :value="option.value">{{option.text}}</option>
					</select>
				</div>

			</div>

			<div class="col-12 mt-2">
				<div class="button w-100 is-success" @click="addAccounts()">
				    <svg class="icon"><use xlink:href="../../assets/bds-icons.min.svg#send-g"></use></svg>
				    <span>Simpan</span>
				</div>
			</div>

		</div>
	</div>

</template>

<script type="text/javascript">

	import {API_ENDPOINT, startloading, endloading} from '../../functions/universal.js';
	const axios = require('axios');

	export default{
		props : ['id','title', 'subtitle', 'link_to_get', 'lint_to_post'],
		data(){
			return{
				data : {}
			}
		},

		methods : {

			getAccounts : function(){
				var app = this;
				startloading(this.$swal);

				axios.get(API_ENDPOINT + this.link_to_get)
					.then(function(response){
						console.log(response);
						app.data = response.data;
						endloading(app.$swal);
					})
					.catch(function(error){

					})
			},

			addAccounts : function() {
				startloading(this.$swal);
			}
		},

		created(){
			this.getAccounts();
		}
	}

</script>