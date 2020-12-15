<template>
	<div>
		<Inputs title="Tambah Edisi" 
				subtitle="Tambahkan dan sunting edisi"
				landing="/jurnal"
				:id = "id" 
				:link_to_get="'/edisi/get.php?id=' + id + '&user_id=' + user_id"
				link_to_post="/edisi/add_update.php"/>
	</div>
</template>

<script type="text/javascript">

	import {getAccountId} from '../../functions/universal.js';
	import Inputs from '../Component/Input.vue';

	export default{
		components : {
			Inputs
		},
		data(){
			return{
				id : "",
				user_id : ''
			}
		},
		created(){
			this.id = this.$route.params.id;
			this.user_id = getAccountId();
		}
	}

</script>