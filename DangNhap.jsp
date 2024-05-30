<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Đăng nhập</title>
    <link rel="stylesheet" href="css/style-login.css">
    <script>
        function validateForm() {
            var username = document.getElementById("username").value;
            var password = document.getElementById("password").value;
            var radios = document.getElementsByName("user");
            var radioChecked = false;

            // Kiểm tra xem có radiobutton nào được chọn không
            for (var i = 0; i < radios.length; i++) {
                if (radios[i].checked) {
                    radioChecked = true;
                    break;
                }
            }

            // Kiểm tra xem username, password và radiobutton có được nhập không
            if (username.trim().length < 5) {
                alert("Tên đăng nhập phải có ít nhất 5 ký tự.");
                return false;
            }
            if (password.trim().length < 5) {
                alert("Mật khẩu phải có ít nhất 5 ký tự.");
                return false;
            }
            if (!radioChecked) {
                alert("Vui lòng chọn loại người dùng.");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <main>
        <form onsubmit="return validateForm()">
            <fieldset>
                <legend><h2>ĐĂNG NHẬP</h2></legend>
                <div class="radio-group">
                    <!-- Đặt id cho label và thay đổi 'for' tương ứng -->
                    <input type="radio" id="sv" name="user" value="sinhvien" class="radio-button" required>
                    <label for="sv" class="label-radio">Sinh viên</label>
                    <!-- Thêm thuộc tính 'required' cho các trường input -->
                    <input type="radio" id="gv" name="user" value="giangvien" class="radio-button" required>
                    <label for="gv" class="label-radio">Giảng viên</label>
                    <input type="radio" id="admin" name="user" value="admin" class="radio-button" required>
                    <label for="admin" class="label-radio">Admin</label>
                    <input type="radio" id="ql" name="user" value="quanli" class="radio-button" required>
                    <label for="ql" class="label-radio">Quản lý</label>
                </div>
                <div class="form-group">
                    <label for="username" class="demuc">Tài khoản:</label>
                    <!-- Thêm thuộc tính 'title' để hiển thị thông báo khi hover chuột -->
                    <input type="text" class="form-control" id="username" name="username" placeholder="Nhập tên đăng nhập" required title="Tên đăng nhập phải có ít nhất 5 ký tự." pattern=".{5,}">
                </div>
                <div class="form-group">
                    <label for="password" class="demuc">Mật khẩu:</label>
                    <input type="password" id="password" name="password" placeholder="Nhập mật khẩu" required title="Mật khẩu phải có ít nhất 5 ký tự." pattern=".{5,}">
                </div>
                <button type="submit" class="login-button">Đăng nhập</button>
            </fieldset>
        </form>
    </main>
</body>
</html>
