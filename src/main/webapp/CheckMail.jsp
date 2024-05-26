<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Check Mail</title>
    <style>
        body, html {
            height: 100%;
            margin: 0;
            font-family: Arial, sans-serif;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #f0f0f0;
        }

        .form-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 300px;
        }

        .form-container h2 {
            margin-bottom: 20px;
        }

        .form-container input[type="text"] {
            width: 92%;
            padding: 10px;
            margin: 10px 10px 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .form-container button {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            background-color: #007bff;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }

        .form-container button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Nhập mã xác nhận</h2>
        <form action="XacNhanMaController" method="post">
        	<p style="color: red">Bạn phải nhập mã được gữi vào email của bạn để xác nhận email là hợp lệ!!</p>
            <input type="text" name="code" placeholder="Nhập mã của bạn" required>
            <button type="submit">Xác nhận</button>
        </form>
    </div>
</body>
</html>
