
var user = {
    init: function () {
        user.loadProvince();
        user.registerEvent();
    },
    registerEvent: function () {
        $('#ddlProvince').off('change').on('change', function () {
            var idProvince = $(this).val();
            if (idProvince >0) {
                user.loadDistrict(parseInt(idProvince));
            } else {
                $('#ddlDistrict').html('');
            }
        });
    },
    loadProvince: function () {
        $.ajax({
            url: "/User/LoadProvince",
            type: "POST",
            dataType: "json",
            success: function (response) {
                var html = '<option value="0">---Chọn tỉnh thành---</option>';
                if (response.status == true) {
                    var data = response.data;
                    $.each(data, function (i, item) {
                        html += '<option value="' + item.ID + '">' + item.Name + '</option>';
                    });
                    $('#ddlProvince').html(html);
                }
            }
        })
    },
    loadDistrict: function (id) {
        $.ajax({
            url: "/User/LoadDistrict",
            type: "POST",
            data: { provinceID: id },
            dataType: "json",
            success: function (response) {
                var html = '<option value="0">---Chọn quận huyện---</option>';
                if (response.status == true) {
                    var data = response.data;
                    $.each(data, function (i, item) {
                        html += '<option value="' + item.ID + '">' + item.Name + '</option>';
                    });
                    $('#ddlDistrict').html(html);
                }
            }
        })
    }
}

user.init();