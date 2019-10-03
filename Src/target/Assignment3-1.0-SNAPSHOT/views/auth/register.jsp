<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register form</title>
        <style>
            body {
                margin: 0;
                padding: 0;
                background-color: #F8F8F8;
                height: 100vh;
            }
            #login .container #login-row #login-column #login-box {
                margin-top: 120px;
                max-width: 600px;
                height: 420px;
                border: 1px solid #9C9C9C;
                background-color: #EAEAEA;
            }
            #login .container #login-row #login-column #login-box #login-form {
                padding: 20px;
            }
            #login .container #login-row #login-column #login-box #login-form #register-link {
                margin-top: -50px;
            }
            #login .container #login-row #login-column #login-box #login-form #btn btn-info btn-md {
                background-color: #5CB85C;
            }
        </style>
    </head>
    <body>
    <center>
        <h2>Create Account</h2><br/>
        <div style="text-align: center;padding: 30px;border: 1px solid green;width: 400px;">
            <form:form action="./register" method="POST" modelAttribute="user" enctype="multipart/form-data">
                <table>
                    <tr>
                        <div style="color: red">${error}</div>
                    </tr>
                    <tr>
                        <td><form:label path="username"  class="form-control">Username: </form:label></td>
                        <td><form:input path="username"  class="form-control"/></td>
                    </tr>
                    <tr>
                        <td><form:label path="password"  class="form-control">Password: </form:label></td>
                        <td><form:input type="password" path="password"  class="form-control"/></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" name="Register" class="btn btn-info btn-md"/></td>
                    </tr>

                </table>
                        
            </form:form>
        </div>
    </center>   
</body>
</html>
