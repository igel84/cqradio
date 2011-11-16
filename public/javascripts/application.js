$(document).ready(function() {	
	jQuery.fn.delPhotoEffect = function() {
		$('a.close').click(function() {
			var num = parseInt($(this).parent().attr('id').substring(10));	
			$(this).parent().remove();
			$('.file-list').hide();
			$('#file-list-'+num).show().attr('value', '');
		});
	};
	
	$('.file-list').hide();
	$('#file-list-0').show();
	$('.file-list').change(function() {
		var file = $(this).val();
		var num = parseInt($(this).attr('id').substring(10));		
		$("<div id='file-name-"+num+"' class='alert-message info' style='margin:5px 70px 0 150px;padding:0 5px 0 5px;'><a class='close' href='#'>×</a><p><strong>"+file+"</strong></p></div>").insertAfter($("#photo-list"));
		$(this).hide();
		var show = false;
		num += 1;
		for (num=0;num<=5;num++)
		{
			if ($('#file-list-'+num).val() == '')
			{
				$('#file-list-'+num).show();
				show = true;
				break;
			}
		}
		if (!show) { alert('за один раз большее кол-во файлов добавить нельзя!'); }
		$('body').delPhotoEffect();
	});
	
	$("#product_photo").change(function() {
		var file = $("#product_photo").val();
		$("<div class='alert-message info' style='margin:5px 70px 0 150px;padding:0 5px 0 5px;'><a class='close' href='#'>×</a><p><strong>"+file+"</strong></p></div>").insertAfter($("#photo-list"));
		//$("#product_photo").val() = '';
		//alert('sdf');
		var count = $("#photo-count").text();
		$("#photo-count").text(parseInt(count)+1);
		
		//var new_input = document.createElement("input");
		//new_input.setAttribute('type', 'file');
		//new_input.setAttribute('multiple');
		//new_input.setAttribute('name', 'product[photos][]');
		//new_input.setAttribute('value', file);
		//new_input.setAttribute('id', count);
		//$(new_input).attr("value", file);
		//$(new_input).appendTo('form.edit_product');
		
		//$("<input type='file' name='product[photos]' id='photo-1' value='"+file+"'/>").appendTo('form.edit_product');
		
		//$("input#photo-1").val(file);
		//style='display:hide;'
		
		//$("#product_photo").val('');
		$("#product_photo").hide();
		$('body').delPhotoEffect();
	});
});
