<template>
	<div>
		<h3>Forum</h3>
		<div class="chatbox">

			<div class="chatlogs">

				<div v-for="chat in message">

					<div v-if="chat.sender != 'self'" class="chat friend">
						<div class="chat-message">
							<p style="margin-bottom: 2px"><b>{{chat.sender}}</b></p>
							<p>{{chat.message}}</p>
						</div>
					</div>

					<div v-else class="chat">
						<div class="self">
							<p class="chat-message">{{chat.message}}</p>
						</div>
					</div>
				</div>
			</div>
		</div>

			<div class="chat-form">
				<textarea></textarea>
				<button> <b-icon icon="cursor-fill" class="rounded-circle bg-success p-2" variant="white"></b-icon> </button>
			</div>
		</div>
	</div>
</template>

<style type="text/css" scoped>
	*{
		margin: 0;
		padding: 0;
		font-family: tahoma, sans-serif;
		box-sizing: border-box;
	}

	.chatbox {
		width: 100%;
		min-width: 390px;
		height: 600px;
		background: #fff;
		padding: 25px;
		margin: 20px auto;
	}

	.chatlogs {
		padding: 10px;
		width: 100%;
		height: 450px;
		overflow-x: hidden;
		overflow-y: scroll;
	}

	.chat {
		font-size: 12px;
		margin-bottom: 10px;
		display: flex;
		flex-flow: row wrap;
		align-items: flex-start;
		position: relative;
	}

	.chat .user-photo{
		width: 60px;
		height: 60px;
		background: #ccc;
		border-radius: 50%;
	}

	.chat .chat-message {
		width: auto;
		padding: 15px;
		margin: 5px 10px 0;
		border-radius: 10px;
		color: #fff;
		font-size: 18px;  
	}

	.friend .chat-message {
		background: #27ae60;
		font-size: 15px;
	}

	.self{
		display: flex;
		position: absolute;
		right: 0;
		font-size: 15px;
	}

	.self .chat-message{
		background: #7f8c8d;
		font-size: 15px;
	}

	.chat-form {
		padding-bottom: 10px;
		display: flex;
		align-items: flex-start;
		position: fixed;
		bottom: 0;
		width: 80%;
	}

	.chat-form textarea {
		background: #fbfbfb;
		width: 75%;
		height: 50px;
		border-radius: 3px;
		resize: none;
		padding: 10px;
		font-size: 18px;
		color: #333;
	}

	.chat-form textarea:focus {
		background: #fff;
	}

	.chat-form button {
		padding: 0 5px;
		font-size: 40px;
		border: none;
		margin: 0 5px;
		cursor: pointer;
		background: transparent;
		margin-top:-5px;

		-webkit-transition: background .2s ease;
		-moz-transition: background .2s ease;
		-o-transition: background .2s ease;
	}

	.chat-form button:focus{
		background: none;
		border:none;
	}

</style>

<script type="text/javascript">
	
	export default{
		data(){
			return{
				message : [
					{
						id : 0,
						message : 'Yeaayyy',
						sender : 'Admin'
					},
					{
						id : 1,
						message : 'wayhiiii',
						sender : 'Eon olek'
					},
					{
						id : 2,
						message : 'ok',
						sender : 'self'
					}
				]
			}
		}
	}

</script>