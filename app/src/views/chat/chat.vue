<template>
	<div>
		<div style="position: fixed;width: 270px;right: 0;margin-right: 30px;bottom:0;box-shadow: 0px 0px 18px 9px rgba(127,127,127,0.16);" >
			
			<div @click="openCloseChat()" style="width: 100%;border-radius: 5px 5px 0px 0px;padding-top: 10px;padding-bottom: 10px;background: #f1c40f; padding-left: 	14px;position: relative;box-shadow: 0px 13px 20px -3px rgba(127,127,127,0.21); z-index: 999999999;right: 0;bottom:0;display: flex;cursor: pointer;">
				<div style="width: 10px;border-radius: 100%;margin-top: 3px;margin-right: 8px;margin-left: 	5px; height: 10px;background: #f39c12"></div>
				<span class="subtitle text-black is-7" style="color: #000"><b>Forum</b></span>
			</div>

			<transition name="slide" mode="in-out">
				<div class="chatbox" style="padding:0;min-width: 250px; width:100%;right: 30px;height: 400px" v-show="chat_visible">
					<div class="chatlogs" id="chatlogs" style="padding-top:25px;">
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

					<div class="chat-form">	
						<input v-on:keyup.enter="sendChat()" v-model="chat_message" class="is-rounded input" type="text" name="">
						<svg @click="sendChat()" v-if="chat_message != ''" class="icon"><use xlink:href="../../assets/bds-icons.min.svg#send-g"></use></svg>
					</div>

				</div>
			</transition>
		</div>
	</div>
</template>

<style type="text/css" scoped>

	/* Enter and leave animations can use different */
	/* durations and timing functions.              */
	.slide-enter-active {
	  transition: all .3s ease;
	}
	.slide-leave-active {
	  transition: all .3s ease;
	}

	.slide-enter, .slide-leave-to
	/* .slide-fade-leave-active below version 2.1.8 */ {
	  transform: translateY(600px);
	}

	*{
		margin: 0;
		padding: 0;
		font-family: tahoma, sans-serif;
		box-sizing: border-box;
	}

	.chatbox {
		width: 100%;
		min-width: 390px;
		height: 420px;
		background: #fff;
		padding: 25px;
	}

	.chatlogs {
		padding: 10px;
		width: 100%;
		height: 345px;
		overflow-x: hidden;
		overflow-y: scroll;
	}

	.chat {
		display: flex;
		flex-flow: row wrap;
		align-items: flex-start;
		position: relative;
		margin-bottom: 5px;
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
	}

	.friend .chat-message {
		background: #27ae60;
		font-size: 13px;
	}

	.self{
		display: flex;
		position: relative;
		right: 0;
		font-size: 13px;
	}

	.self .chat-message{
		background: #7f8c8d;
		font-size: 15px;
	}

	.chat-form {
		display: flex;
		padding:10px;
	}

	.chat-form input{
		background: #f0f2f5;
		font-size:13px;
	}

	.chat-form svg {
		font-size: 20px;
		margin-top: 5px;
		margin-left: 7px;
		margin-right: 2px;
		fill:#000;
		opacity: 0.4;
		cursor: pointer;
		transition: all 0.2s ease;
	}

	.chat-form svg:hover{
		fill : #000;
		opacity: 0.7;
	}

	*::-webkit-scrollbar {
    	width: 0.6em;
	}

 
	*::-webkit-scrollbar-thumb {
	 	background-color: darkgrey;
	  	outline: 1px solid slategrey;
	}		

</style>

<script type="text/javascript">
	
	export default{
		data(){
			return{
				chat_message : "",
				chat_visible : false,
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
					},
				]
			}
		},

		methods : {

			openCloseChat : function(){
				if(this.chat_visible == false){
					this.chat_visible = true;
					this.scrollToEnd();
				}
				else{
					this.chat_visible = false;
					this.scrollToEnd();
				}
			},

			sendChat : function(){

				let chat_msg = this.chat_message;
				let chat_data = {
					id : 3,
					message : chat_msg,
					sender : 'self'
				}

				this.message.push(chat_data);
				this.chat_message = "";
			},

			scrollToEnd: function(){
				var container = document.getElementById('chatlogs');
				container.scrollTop = (container.scrollHeight + 90);

				container = document.getElementById('chatlogs');
				container.scrollTop = (container.scrollHeight + 90);
			}
		},

		updated(){
			this.scrollToEnd();
		}
	}

</script>