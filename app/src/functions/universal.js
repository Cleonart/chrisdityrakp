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