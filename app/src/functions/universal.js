export let API_ENDPOINT = "http://127.0.0.1/jurnal";

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

export function getAccountName(){
	let credential_name = sessionStorage.getItem("name_credential");
	return credential_name;
}