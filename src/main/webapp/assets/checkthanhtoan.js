let MY_BANK = {
	BANK_ID: "MB",
	ACOUNT_ID: "0785767354"
}

document.addEventListener("DOMContentLoaded", () => {
	const btns = document.querySelectorAll(".course_item_btn");
	const paid_content = document.getElementById("paid_content");
	const paid_price = document.getElementById("paid_price");
	const courses_qr_img = document.querySelector(".courses_qr_img");
	btns.forEach((item) => {
		item.addEventListener("click", () => {
			const coursesID = item.getAttribute("data-coursesID");
			const coursesPrice = item.getAttribute("data-coursesPrice");

			const paidContent = `${coursesID}`;
			
			const paidPrice = coursesPrice;
			
			let QR = `https://img.vietqr.io/image/${MY_BANK.BANK_ID}-${MY_BANK.ACOUNT_ID}-compact2.png?amount=${paidPrice}&addInfo=${paidContent}`
			courses_qr_img.src = QR;
			document.getElementById("ndck").style.display = "block"
			document.getElementById("stck").style.display = "block"
			paid_content.innerHTML = paidContent;
			paid_price.innerHTML = paidPrice;
			 startCountdown(30, countdown); // 5 phút
			setInterval(() => {
				fetchDataAndProcess(paidPrice, paidContent);
			}, 5000);
		});
	});
});

// tạo 1 cái packege const
//sau đó public string Price ="price"
//sau đó thay các gái trị const vào sẽ khó lộn code

// Gửi yêu cầu GET đến URL và nhận dữ liệu

let isSuccess = false; // Khởi tạo biến trạng thái
function fetchDataAndProcess(price, content) {
	if (isSuccess) {
		return; // Nếu đã thanh toán thành công, không cần kiểm tra nữa
	}
	// Gửi yêu cầu GET đến URL và nhận dữ liệu
	fetch('https://script.google.com/macros/s/AKfycbw9Aa_VZkFsv9u-BeOKDtdLbs3QvllBtMvUpompRbuxf4xPTk4ykFTnyIL-Q3h2LtaF/exec')
		.then(response => {
			// Kiểm tra nếu phản hồi không thành công
			if (!response.ok) {
				throw new Error('Đã xảy ra lỗi khi gửi yêu cầu: ' + response.status);
			}
			// Trả về phản hồi dưới dạng JSON
			return response.json();
		})
		.then(data => {
			// Xử lý dữ liệu JSON nhận được
			const lastPaid = data.data[data.data.length - 1]; // Lấy ra thông tin thanh toán cuối cùng
			const lastPrice = lastPaid["price"]; // Lấy giá trị của thuộc tính "price" trong thanh toán cuối cùng
			const lastContent = lastPaid["content"]; // Lấy giá trị của thuộc tính "content" trong thanh toán cuối cùng

			if (lastPrice == parseInt(price) && lastContent.includes(content)) {
				alert("Thanh toán thành công");
				document.getElementById("httt").style.display = "block"
				document.getElementById("htttp").style.display = "block"
				isSuccess = true; // Đặt biến trạng thái thành true
				
			}
		})
		.catch(error => {
			// Xử lý lỗi nếu có
			console.error('Đã xảy ra lỗi:', error);
		});
}

function redirectToServlet() {
    var xhr = new XMLHttpRequest();
    xhr.open('GET', 'http://localhost:8080/BaiThiJava/giospcontroller', true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                // Xử lý kết quả nếu cần
            } else {
                console.error('There was a problem with the request.');
            }
        }
    };
    xhr.send();
}

    // Hàm bắt đầu đếm ngược
    function startCountdown(duration, display) {
        let timer = duration, minutes, seconds;
        setInterval(function () {
            minutes = parseInt(timer / 60, 10);
            seconds = parseInt(timer % 60, 10);

            minutes = minutes < 10 ? "0" + minutes : minutes;
            seconds = seconds < 10 ? "0" + seconds : seconds;

            display.textContent = minutes + ":" + seconds;

            if (--timer < 0) {
                timer = duration;
                redirectToServlet(); // Chuyển hướng đến trang servlet sau khi hết thời gian
            }
        }, 1000);
    }

