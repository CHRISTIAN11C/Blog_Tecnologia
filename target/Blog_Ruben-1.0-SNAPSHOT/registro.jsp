<%@page import="java.text.SimpleDateFormat"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.emergentes.modelo.Aviso"%>
<%
    Aviso aviso = (Aviso) request.getAttribute("aviso");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>NUEVA ENTRADA</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    </head>
    <body>
        <div class="datos" style="max-width: 400px; margin: 0 auto; border: 1px solid #ccc; padding: 20px;">
            <p>PRACTICA 4 TEM-742</p>
            <p>NOMBRE: Ruben Condori Cosme</p>
            <p>CARNET: 7092342</p>
        </div>
        <div class="container">
            <h1>Nueva Entrada</h1>
            <form action="AvisoController" method="post">
                <input type="hidden" name="id" value="${aviso.id}" />
                <div class="form-group">
                    <label>Fecha</label>
                    <input type="date" id="fecha" name="fecha" value=${aviso.fecha} required>
                </div>

                <div class="form-group">
                    <label>Titulo</label>
                    <textarea name="titulo" class="form-control">${aviso.titulo}</textarea>
                </div>
                <div class="form-group">
                    <label>Contenido</label>
                    <textarea name="contenido" class="form-control">${aviso.contenido}</textarea>
                </div>

                 <div style="text-align: right;" class="action">
                     <input type="submit" class="btn btn-primary" value="Enviar" />
                     <input type="submit" class="btn-success" value="Volver" />
                 </div>
            </form>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>                    
    </body>
</html>
