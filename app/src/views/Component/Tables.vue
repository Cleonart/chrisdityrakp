<template>
	<div>
		<table class="table table-striped mt-4">
		  <thead>
		    <tr>
		      <th scope="col"  v-for="head in table_data_head">{{head}}</th>
		      <th scope="col">Aksi</th>
		    </tr>
		  </thead>
		  <tbody>
		  	<tr v-for="body in table_data_body">
		  		<th v-for="item in body" v-if="item.type != 'id'" class="subtitle is-5">
		  			<span v-if="Array.isArray(item.title)" style="font-weight:normal"> 
		  				<span v-for="item_data in item.title">{{item_data}}; </span>
		  			</span>
		  			<span v-else style="font-weight:normal">{{item.title}}</span>
		  		</th>
		  		<th>
		  			<div style="display: flex;font-size: 18px">
		  				<b-icon style="cursor:pointer;margin-right:7px" icon="arrow-up-right-square-fill" class="text-success"></b-icon>
			  			<b-icon style="cursor:pointer;margin-right:7px" icon="archive-fill" class="text-primary"></b-icon>
			  			<b-icon style="cursor:pointer" icon="download" variant="warning"></b-icon>
		  			</div>
		  		</th>
		  	</tr>
		  </tbody>
		</table>
	</div>
</template>

<style type="text/css">

</style>

<script type="text/javascript">
	export default{
		props: ['table_data_head', 'table_data_body'],
		data(){
			return{

			}
		}
	}
</script>