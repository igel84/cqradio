$(document).ready(function() {
	//древовидное меню
	$(".menu-product").treeview(
		{ persist: "location", collapsed: true, unique: true, animated: "fast", persist: "cookie"
			//,toggle: function() { alert(this + " переключено!"); }
		}
	);

	//лента
	var div = $('div.sc_menu'),
		ul = $('ul.sc_menu'),
		ulPadding = 15;

	//Get menu width
	var divWidth = div.width();

	//Remove scrollbars
	div.css({overflow: 'hidden'});

	//Find last image container
	var lastLi = ul.find('li:last-child');

	//When user move mouse over menu
	div.mousemove(function(e){
		//As images are loaded ul width increases,
		//so we recalculate it each time
		var offset = lastLi.offset();
		var ulWidth = offset.left + lastLi.outerWidth() + ulPadding;
		var left = (e.pageX - div.offset().left) * (ulWidth-divWidth) / divWidth;
		div.scrollLeft(left);
	});

	$('#find-but').click(function(){
		var text = $('#find-text').val();
		window.location = 'http://cqradio.igel84.locum.ru/find/' + text;
		return false;
	});

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
