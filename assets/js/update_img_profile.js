$('#btn-upload-img').click(function() {
    var file_data = $('#img-upload').prop('files')[0]
    var form_data = new FormData()             
    form_data.append('file', file_data)     
    $.ajax({
        url: 'assets/php/update_img.php',
        dataType: 'text', 
        cache: false,
        contentType: false,
        processData: false,
        data: form_data,                         
        type: 'post',
        success: function(response){
			if (response){
				LoadUserData()
				$("#img").attr("src", "data:image/jpeg;base64," + profileImg)
				$("#success-dlg").show()
				setTimeout(function () {
					$('#success-dlg').fadeOut('slow');
				}, 1000);
			}
        }
     })
})