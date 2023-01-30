$(document).ready(function(){
	$('#department_name').on('change', fn_check_duplicate_department_name);
});

function fn_check_duplicate_department_name(){
	var check_name = $('#elm_department_name').val(); 

	$.ceAjax('request', fn_url("departments.department_name"), { 
		data: {
			check_name: check_name,
		},
	});
}
(Tygh, Tygh.$);
