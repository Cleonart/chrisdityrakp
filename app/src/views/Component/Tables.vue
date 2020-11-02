<template>
	<div>
		<table class="table table-striped mt-4">
		  <thead>
		    <tr>
		      <th scope="col" v-for="head in table_data.head">{{head}}</th>
		      <th scope="col">Aksi</th>
		    </tr>
		  </thead>
		  <tbody>
		  	<tr v-for="body in table_data.body">
		  		<th v-for="item in body"><span style="font-weight:normal">{{item.title}}</span></th>
		  		<th><span style="font-weight:normal;font-size:20px;">
		  			<b-icon style="cursor:pointer;margin-right:5px" icon="arrow-up-right-square-fill" class="text-success"></b-icon>
		  			<b-icon style="cursor:pointer" icon="archive-fill" class="text-primary"></b-icon>
		  		</span></th>
		  	</tr>
		  </tbody>
		</table>
	</div>
</template>

<style type="text/css">

</style>

<script type="text/javascript">
	export default{
		props: ['table_data'],
		data(){
			return{

			}
		}
	}
</script>