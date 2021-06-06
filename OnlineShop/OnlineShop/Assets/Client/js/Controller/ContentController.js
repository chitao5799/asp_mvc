var content = {
    init: function () {
        content.registerEvetns();
    },
    registerEvetns: function () {
        $('.btn-images').off('click').on('click', function (e) {
            e.preventDefault();
            $("#imagesManage").modal('show');
            $("#hidContentID").val($(this).data('id'));
            content.loadImages();
        });

        $('#btnChooseImage').off('click').on('click', function (e) {
            e.preventDefault();
            var finder = new CKFinder();
            finder.selectActionFunction = function (url) {
                $('#imageList').append('<div style="float:left"><img src="' + url + '" width="50" /><a href="#" class="btn-delImage"><i class="fa fa-times"></i></a></div>');

                $('.btn-delImage').off('click').on('click', function (e) {
                    e.preventDefault();
                    $(this).parent().remove();
                });
            };
            finder.popup();
        });

        $('#btnSaveImages').off('click').on('click', function () {
            var _id = $("#hidContentID").val();
            var images = [];
            $.each($('#imageList img'), function (i, item) {
                images.push($(item).prop('src'));
            });

            $.ajax({
                url: '/Admin/Content/SaveImages',
                type: 'POST',
                data: {
                    id:_id,
                    images: JSON.stringify(images)
                },
                dataType: 'json',
                success: function (response) {
                    if (response.status) {
                        $("#imagesManage").modal('hide');
                        $('#imageList').html('');
                        alert('save thành công');
                    }
                    
                }
            });
        });
    },
    loadImages: function () {
        $.ajax({
            url: '/Admin/Content/LoadImage',
            type: 'GET',
            data: {
                id: $("#hidContentID").val()
            },
            dataType: 'json',
            success: function (response) {
                var data = response.data;
                var html = '';
                $.each(data, function (i, item) {
                    html += '<div style="float:left"><img src="' + item + '" width="50" /><a href="#" class="btn-delImage"><i class="fa fa-times"></i></a></div>'
                });
                $('#imageList').html(html);
                $('.btn-delImage').off('click').on('click', function (e) {
                    e.preventDefault();
                    $(this).parent().remove();
                });
            },
            error: function () {
                $('#imageList').html('');
            }
        });
    }
}

content.init();