<template>
	<div>
		<h3>Daftar Jurnal</h3>
		<p>Kelola daftar jurnal disini</p>
		<Tables :table_data="table_data"></Tables>
	</div>
</template>

<script type="text/javascript">
	
	import Tables from './Component/Tables.vue';

	export default{
		data(){
			return{
				table_data : {
					head : ['ID', "Nama Pengusung", "Jurnal"],
					body : [
						[
							{ title : '#111' },
							{ title : 'Jane Doe, John Doe' },
							{ title : 'Realtech' }
						],
						[
							{ title : '#112' },
							{ title : 'Jane Doe, John Doe' },
							{ title : 'Lasallian' }
						]
					]
				}
			}
		},
		components : {
			Tables
		}
		
	}
</script>