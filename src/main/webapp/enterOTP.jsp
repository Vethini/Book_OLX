
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Enter OTP</title>
    <style> 
      
    body {
    font-family: Arial, sans-serif;
    background-image: url('img/otp1.png');
    background-size: cover;
    background-position: center;
    margin: 0;
    padding: 0;
    height: 100vh;
    position: relative; /* Added */
	}

	.container {
    background-color: rgba(200, 200, 255, 0.7);;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
    width: 300px;
    /* //height: 500px; */
    position: absolute; /* Added */
    top: 1%; /* Added */
    left: 49%; /* Added */
    transform: translateX(-50%); /* Added */
	}

	h2 {
    text-align: center;
    margin-bottom: 20px;
	}

	form {
    display: flex;
    flex-direction: column;
    width: 100%; /* Take full width */
	}

	label {
    font-weight: bold;
    margin-bottom: 10px;
    text-align: left; /* Align labels to the left */
	}

	input[type="text"] {
    padding: 10px;
    margin-bottom: 20px;
    border-radius: 4px;
    border: 1px solid #ccc;
    font-size: 16px;
    outline: none;
    width: 100%; /* Take full width */
	}

	input[type="submit"] {
    padding: 10px;
    border: none;
    border-radius: 4px;
    background-color: #007bff;
    color: #fff;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s ease;
    width: 100%; /* Take full width */
	}

	input[type="submit"]:hover {
    background-color: #0056b3;
	}

	.error {
    color: red;
    text-align: center;
    margin-top: 10px;
	}
       
        
    </style>
</head>
<body>
<%response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); %>
    <div class="container">
        <h2>Enter OTP</h2>
        <% if (request.getAttribute("error") != null) { %>
            <p class="error"><%= request.getAttribute("error") %></p>
        <% } %>
        <form action="verifyOTP" method="post">
            <label for="otp">Enter OTP:</label>
            <input type="text" id="otp" name="otp" required>
            <input type="submit" value="Verify OTP">
        </form>
    </div>
</body>
</html>
 