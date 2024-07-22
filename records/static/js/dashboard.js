document.addEventListener("DOMContentLoaded", function() {
    const nowButton = document.getElementById("datetime-now");
    const datetimeInput = document.getElementById("datetime");
    const listAllButton = document.querySelector(".list-all-btn");
    const addRecordForm = document.getElementById("add-record-form");
    const recordsTbody = document.getElementById("records-tbody");

    nowButton.addEventListener("click", function() {
        const now = new Date();
        const year = now.getFullYear();
        const month = String(now.getMonth() + 1).padStart(2, '0'); // Months are zero-indexed
        const day = String(now.getDate()).padStart(2, '0');
        const hours = String(now.getHours()).padStart(2, '0');
        const minutes = String(now.getMinutes()).padStart(2, '0');
        
        const formattedNow = `${year}-${month}-${day}T${hours}:${minutes}`;
        datetimeInput.value = formattedNow;
    });
    listAllButton.addEventListener("click", function() {
        fetch('/dashboard/list_all/', {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRFToken': getCookie('csrftoken')
            }
        })
        .then(response => response.json())
        .then(data => {
            recordsTbody.innerHTML = '';
            data.record_data.forEach(record => {
                const row = document.createElement('tr');
                row.innerHTML = `
                    <td>${record.date}</td>
                    <td>${record.time}</td>
                    <td>${record.kilometer} km</td>
                    <td>${record.bike_model}</td>
                    <td>${record.battery_model}</td>
                    <td><button class="btn btn-edit"><i class="fas fa-edit"></i></button></td>
                    <td><button class="btn btn-delete"><i class="fas fa-trash-alt"></i></button></td>
                `;
                recordsTbody.appendChild(row);
            });

            addEditAndDeleteEventListeners();
        })
        .catch(error => console.error('Error:', error));
    });

    addRecordForm.addEventListener("submit", function(event) {
        event.preventDefault();
        const formData = new FormData(addRecordForm);

        fetch('/dashboard/record_ride/', {
            method: 'POST',
            body: formData,
            headers: {
                'X-CSRFToken': getCookie('csrftoken')
            }
        })
        .then(response => response.json())
        .then(data => {
            addRecordForm.reset();
            recordsTbody.innerHTML = '';
            data.record_data.forEach(record => {
                const row = document.createElement('tr');
                row.innerHTML = `
                    <td>${record.date}</td>
                    <td>${record.time}</td>
                    <td>${record.kilometer} km</td>
                    <td>${record.bike_model}</td>
                    <td>${record.battery_model}</td>
                    <td><button class="btn btn-edit"><i class="fas fa-edit"></i></button></td>
                    <td><button class="btn btn-delete"><i class="fas fa-trash-alt"></i></button></td>
                `;
                recordsTbody.appendChild(row);
            });

            addEditAndDeleteEventListeners();
        })
        .catch(error => console.error('Error:', error));
    });

    function addEditAndDeleteEventListeners() {
        document.querySelectorAll('.btn-edit').forEach(button => {
            button.addEventListener('click', function() {
                alert('Edit button clicked');
                // Your edit logic here
            });
        });

        document.querySelectorAll('.btn-delete').forEach(button => {
            button.addEventListener('click', function() {
                alert('Delete button clicked');
                // Your delete logic here
            });
        });
    }

    function getCookie(name) {
        let cookieValue = null;
        if (document.cookie && document.cookie !== '') {
            const cookies = document.cookie.split(';');
            for (let i = 0; i < cookies.length; i++) {
                const cookie = cookies[i].trim();
                if (cookie.substring(0, name.length + 1) === (name + '=')) {
                    cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                    break;
                }
            }
        }
        return cookieValue;
    }
});
