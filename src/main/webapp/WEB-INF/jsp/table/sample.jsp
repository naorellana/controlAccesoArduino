<%@ page import="java.util.Map" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Display All Request Parameters</title>
</head>
<body>
<h4>List of Request Parameter Names and its Values</h4>
    <%
        Map<String, Object> modelMap = (Map<String, Object>) request.getAttribute("parameters");
        int i=0;
        String nombreTabla,campo,tipoVar, checkPrimary, checkNull, checkUnique;
        nombreTabla="nombreTabla";
        campo="campo";
        tipoVar="tipoVar";
        checkPrimary="checkPrimary";
        checkNull="checkNull";
        checkUnique="checkUnique";
        String sql="";
        for(String key: modelMap.keySet()){
            out.print(key);
            out.print(" : ");
            out.print(modelMap.get(key));
            out.print("<br />");
           i++;
           //j++;
           //sql=sql+i;
           //out.print(i);
           
               
                /*if (j==i){
                campo=campo+j;
                tipoVar=tipoVar+j;
                checkPrimary=checkPrimary+j;
                checkNull=checkNull+j;
                checkUnique=checkUnique+j;}*/
               if (nombreTabla.equals(key)){
                   sql=sql+"Insert into "+modelMap.get(key);
               }
               
           
            /*campo="campo";
            tipoVar="tipoVar";
            checkPrimary="checkPrimary";
            checkNull="checkNull";
            checkUnique="checkUnique";*/
           }
           
        for (int j=0; j<3; j++){
            campo=campo+j;
            tipoVar=tipoVar+j;
            checkPrimary=checkPrimary+j;
            checkNull=checkNull+j;
            checkUnique=checkUnique+j;
            
         out.print(sql);
        }
         
    %>
</body>
</html>