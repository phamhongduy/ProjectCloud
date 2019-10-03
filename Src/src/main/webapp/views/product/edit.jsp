<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
    <jsp:include page="../header.jsp"></jsp:include>
        <body>
        <jsp:include page="../nav.jsp"></jsp:include>


            <div class="container">

                <div class="row">

                    <div class="col-md-3">
                        <p class="lead">Shop Name</p>
                        <div class="list-group">
                        <c:forEach items="${listCate}" var="item">
                            <a href="./index?keyword=&id=${item.id}" class="list-group-item">${item.name}</a>
                        </c:forEach>
                    </div>
                </div>

                <div class="col-md-9">

                    <div class="thumbnail">
                        <form:form method="post" action="./edit" modelAttribute="product" enctype="multipart/form-data">
                            <img class="img-responsive" src="/image/${product.thumnail}" alt="">
                        <div class="caption-full">
                            <table>
                                <tr>
                                    <td><form:label path="id">ID</form:label></td>
                                    <td><form:input path="id" readonly="true"/></td>
                                </tr>
                                <tr>
                                    <td><form:label path="name">Name</form:label></td>
                                    <td><form:input path="name"/><form:errors path="name" cssStyle="color:red;display:block"/></td>
                                </tr>
                                <tr>
                                    <td><form:label path="description">Description</form:label></td>
                                    <td><form:input path="description"/></td>
                                </tr>
                                <tr>
                                    <td><form:label path="price">Price</form:label></td>
                                    <td><form:input path="price"/></td>
                                </tr>
                                <tr>
                                    <td><form:label path="amount">Amount</form:label></td>
                                    <td><form:input path="amount"/></td>
                                </tr>
                                <tr>
                                    <td><form:label path="thumnail">Thumbnail</form:label></td>
                                    <td><form:input path="thumnail"/></td>
                                </tr>
                                <tr>
                                    <td><form:label path="category.id">Danh mục</form:label><br/></td>
                                    <td><form:select path="category.id">
                                    <option value="-1">Select a type</option>
                                    <c:forEach items="${listCate}" var="item">
                                        <c:choose>
                                            <c:when test="${item.id == product.category.id}">
                                                <option value="${item.id}" selected="true">
                                                    ${item.name}
                                                </option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="${item.id}">
                                                    ${item.name}
                                                </option>
                                            </c:otherwise>
                                        </c:choose>

                                    </c:forEach>
                                </form:select></td>
                                </tr>
                                <tr>
                                    <td>upload image :</td>
                                    <td><input type="file" name="file"><br/></td>
                                </tr>
                            
                            </table>
                            <input type="submit" class="btn btn-outline-info btn-block" value="Xác Nhận">
                          
                        </form:form>
                            <a href="../home/index" class="btn btn-outline-info btn-block">Hủy</a>
                        </div>

                    </div>

                </div>

            </div>

        </div>
<jsp:include page="../footer.jsp"></jsp:include>
</html>
