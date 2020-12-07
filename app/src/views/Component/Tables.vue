<template>
	<div>

		<table class="table mt-4 mb-5 is-hoverable">
		  <thead class="is-primary">
		    <tr>
		      <th scope="col" style="border-bottom: none;padding-bottom: 15px;" v-for="head in table_data_head">{{head}}</th>
		      <th scope="col" style="border-bottom: none;padding-bottom: 15px;">Aksi</th>
		    </tr>
		  </thead>
		  <tbody>
		  	<tr v-for="(body,index) in table_data_body" style="cursor: pointer;">
		  		<th v-for="item in body" v-if="item.type != 'id'" class="subtitle is-5">
		  			<span v-if="Array.isArray(item.title)" style="font-weight:normal">
		  				<span v-for="(item_data,index_data) in item.title">
			  				<span class="tag is-light mb-1" :id="'author' + item_data">{{item_data}};</span>
			  				<b-tooltip :target="'author' + item_data">Penulis ke {{index_data + 1}}</b-tooltip>
		  				</span>
		  			</span>

		  			<span v-else style="font-weight:normal">{{item.title}}</span>
		  		</th>
		  		<th>
		  			<slot v-bind:body="body"></slot>
		  			<!--
		  			<div v-if="!admin" style="display: flex;font-size: 18px">
		  				<span class="mr-2" :id="'archive' + index">
		  						<svg class="icon is-right has-fill-primary"><use xlink:href="../../assets/bds-icons.min.svg#unarchive-g"></use></svg>
		  				</span>
		  				<span :id="'download' + index">
		  					<svg class="icon is-right has-fill-success"><use xlink:href="../../assets/bds-icons.min.svg#download-g"></use></svg>
		  				</span>

		  				tooltip 
		  				<b-tooltip :target="'archive' + index">Arsipkan</b-tooltip>
		  				<b-tooltip :target="'download' + index">Unduh</b-tooltip>
		  			</div>
		  			<div v-else style="font-size: 20px;display:flex;">

		  				<span class="mr-2" :id="'agree' + index">
		  						<svg class="icon is-right has-fill-success"><use xlink:href="../../assets/bds-icons.min.svg#check-bold-g"></use></svg>
		  				</span>
		  				<span class="mr-2" :id="'disagree' + index">
		  						<svg class="icon is-right has-fill-danger"><use xlink:href="../../assets/bds-icons.min.svg#cross-bold-g"></use></svg>
		  				</span>

		  				tooltip 
		  				<b-tooltip :target="'agree' + index">Setujui</b-tooltip>
		  				<b-tooltip :target="'disagree' + index">Tolak</b-tooltip>-->
		  		</th>
		  	</tr>

		  </tbody>
		</table>
		<div v-if="table_data_body.length == 0" class="message is-danger">
			<svg class="icon is-right has-fill-danger"><use xlink:href="../../assets/bds-icons.min.svg#warning-bold-g"></use></svg>
			<span class="ml-3">Tidak ada data ditemukan</span>
		</div>
	</div>
</template>

<style type="text/css">

</style>

<script type="text/javascript">
	export default{
		props: ['table_data_head', 'table_data_body', 'admin'],
		data(){
			return{

			}
		}
	}
</script>