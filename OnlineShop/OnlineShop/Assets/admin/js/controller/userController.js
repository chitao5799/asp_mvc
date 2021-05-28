var user = {
    init: function () {
        user.registerEvents();
    },
    registerEvents: function () {
        $('.btn-active').off('click').on('click', function (e)//off('click') click lần đầu tiên không có tác dụng
        {
            e.preventDefault();//ngăn di chuyển đến link của thẻ a
            var btn = $(this);
            /**
             *bên html phải đặt tên thuộc tính là data-user_id. 
             * Tức định dạng là data-<biến(không được đặt chữ hoa vì trên browser nó thành chữ thường)>. 
             * Cách 2: $(this).prop('user_id');  */
            var _id = btn.data('user_id'); 

            $.ajax({
                url: "User/ChangeStatus",
                data: { userId: _id },
                dataType: "json",
                type: "POST",
                success: function (response) {
                    if (response.userStatus == true) {
                        btn.text('Kích hoạt');
                    }
                    else {
                        btn.text('Khóa');
                    }
                }
            });
        });
    }
}

user.init();