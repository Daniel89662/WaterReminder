<%-- 
    Document   : inicio
    Created on : 16/05/2022, 08:46:54 PM
    Author     : Alumno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    //primero vamos a saber si tiene una sesion
    String usuario = "";
    HttpSession sesionusu = request.getSession();
    if(sesionusu.getAttribute("usuario")==null){
    %>
    <jsp:forward page="index.html" >
        <jsp:param name="error" 
                   value="Es obligatorio tener una sesion activa" ></jsp:param>
    </jsp:forward>
    
    
    <%
    
    }else{
        //si hay sesion
        usuario = (String)sesionusu.getAttribute("usuario");
    }

    %>



<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        encabezado
        <h1>Si existe</h1>
        body
        <% 
            //si privilegio == 1
            /*
            quiero que salga la tabla de todos los elementos
            de los reportes equipo
            
            select equipo_etiqueta, lab_nom, marca_nom, cpu_serial,  
            config_descripcionMause, config_descripcionTeclado, monitor_descripcion, 
            config_descripcion, edoEquipo_tipo, problema
            from dequipo as eq
            inner join claboratorio as la
            ON (la.lab_id = eq.lab_id)
            inner join cmarca as ma
            ON (eq.marca_id = ma.marca_id)
            inner join maccesorio as mac
            ON(eq.accesorio_id = mac.accesorio_id)
            inner join mmonitor as mo
            ON(eq.monitor_id = mo.monitor_id )
            inner join mconfiguracion as con
            on(eq.config_id = con.config_id)
            inner join cedoequipo as edo
            on(eq.edoEquipo_id = edo.edoEquipo_id);
            
            */
        %>
        
        <% 
            //si privilegio == 2
        %>
        
        <% 
            //si privilegio == 3
        %>
        patitas
    </body>
</html>