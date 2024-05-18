/**
 * 
 */

let notifications = document.querySelector('.notifications');
console.log(notifications);
 function createToast(type, icon, title, text){
       let newToast = document.createElement('div');
        newToast.innerHTML = 
        `
            <div class="toasts ${type}">
                <i class="${icon}"></i>
                <div class="contents">
                    <div class="titles">${title}</div>
                    <span>${text}</span>
                </div>
                <i class="fa-solid fa-xmark" onclick="(this.parentElement).remove()"></i>
            </div>
            `;
            notifications.appendChild(newToast);
        notifications.timeOut = setTimeout(
            ()=>notifications.remove(), 5000
        )
    }