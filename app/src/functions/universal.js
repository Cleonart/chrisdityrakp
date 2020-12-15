//export let API_ENDPOINT = "http://127.0.0.1/jurnal";
export let API_ENDPOINT = "http://192.168.1.8/jurnal";

export function startloading(swal_){

	swal_({
		icon: 'warning',
		title: 'Mohon tunggu',
		text: 'Sedang mengambil data...',
		allowOutsideClick: false,
		showConfirmButton: false,
		timerProgressBar: true,
		onBeforeOpen: () => {
		    swal_.showLoading()
		},		
	});

}

export function endloading(swal_){
	swal_.close();
}

export function validateLoginCredential(routers){
	if(!loggedIn()){
    	routers.replace("/login");
    }
}

export function loggedIn(){
	let credential_id = sessionStorage.getItem("id_credential");
	if(credential_id == null){
		return false;
	}
	return true;
}

export function isAdmin(){
	let credential_stats = sessionStorage.getItem('stats');
	if(credential_stats == 'c81e728d9d4c2f636f067f89cc14862c'){
		return false;
	}
	return true;
}

export function adminAccess(routers){
	if (!isAdmin()){
		routers.replace("/login");
	}
}

export function getAccountName(){
	let credential_name = sessionStorage.getItem("name_credential");
	return credential_name;
}

export function getAccountId(){
	let credential_id = sessionStorage.getItem("session");
	return credential_id;

}