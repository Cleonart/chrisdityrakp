<template>
	<div>
		<Inputs title="Pengaturan Akun" 
				subtitle="Tambahkan atau sunting akun"
				landing="/akun"
				:id = "id" 
				:link_to_get="'/akun/get.php?id=' + id"
				link_to_post="/akun/add_update.php"/>
	</div>
</template>

<script type="text/javascript">

	import Inputs from '../Component/Input.vue';

	export default{
		components : {
			Inputs
		},
		data(){
			return{
				id : ""
			}
		},
		created(){
			this.id = this.$route.params.id;
		}
	}

</script>