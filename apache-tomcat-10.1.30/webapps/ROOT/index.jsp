<!DOCTYPE html>
<html>
<head>
    <title>Simple JSP Calculator</title>
</head>
<body>
    <h1>Simple Calculator</h1>

    <form method="post" action="index.jsp">
        <label>Number 1:</label>
        <input type="number" name="num1" required>
        <br><br>

        <label>Number 2:</label>
        <input type="number" name="num2" required>
        <br><br>

        <label>Operation:</label>
        <select name="operation">
            <option value="add">Add</option>
            <option value="subtract">Subtract</option>
            <option value="multiply">Multiply</option>
            <option value="divide">Divide</option>
        </select>
        <br><br>

        <input type="submit" value="Calculate">
    </form>

    <%
        // Handling form submission in JSP
        String num1Str = request.getParameter("num1");
        String num2Str = request.getParameter("num2");
        String operation = request.getParameter("operation");

        if (num1Str != null && num2Str != null && operation != null) {
            double num1 = Double.parseDouble(num1Str);
            double num2 = Double.parseDouble(num2Str);
            double result = 0;
            boolean validOperation = true;

            switch (operation) {
                case "add":
                    result = num1 + num2;
                    break;
                case "subtract":
                    result = num1 - num2;
                    break;
                case "multiply":
                    result = num1 * num2;
                    break;
                case "divide":
                    if (num2 != 0) {
                        result = num1 / num2;
                    } else {
                        out.println("<p style='color:red;'>Cannot divide by zero!</p>");
                        validOperation = false;
                    }
                    break;
                default:
                    out.println("<p style='color:red;'>Invalid operation selected!</p>");
                    validOperation = false;
                    break;
            }

            if (validOperation) {
                out.println("<h2>Result: " + result + "</h2>");
            }
        }
    %>
</body>
</html>

