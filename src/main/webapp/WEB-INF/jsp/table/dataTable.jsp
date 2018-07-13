
<jsp:include page="../header.jsp" />
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="datosTabla">
	<h4>List of Request Parameter Names and its Values</h4>
    <%
        Map<String, Object> modelMap = (Map<String, Object>) request.getAttribute("parameters");
        int i=0;
        String nombreTabla,campo,tipoVar, checkPrimary, checkNull, checkUnique;
        nombreTabla="nombreTabla";
        /*campo="campo";
        tipoVar="tipoVar";
        checkPrimary="checkPrimary";
        checkNull="checkNull";
        checkUnique="checkUnique";*/
        String sql="";
        String reg="";
           
        for (int j=1; j<(modelMap.size()/5)+1; j++){
            campo="campo";
            tipoVar="tipoVar";
            checkPrimary="checkPrimary";
            checkNull="checkNull";
            checkUnique="checkUnique";
            campo=campo+j;
            tipoVar=tipoVar+j;
            checkPrimary=checkPrimary+j;
            checkNull=checkNull+j;
            checkUnique=checkUnique+j;
            
            
            
            for(String key: modelMap.keySet()){
                i++;
            out.print(key);
            out.print(" : ");
            out.print(modelMap.get(key));
            out.print("<br />");

               if (nombreTabla.equals(key)){
                   sql=sql+"create table "+modelMap.get(key);
               }
               if (campo.equals(key)){
                   sql=sql+" ( "+modelMap.get(key); 
               }
               
               if (tipoVar.equals(key)){
                   sql=sql+" "+modelMap.get(key) +"(30) "; 
               }
               
               if (checkPrimary.equals(key)){
                   sql=sql+modelMap.get(key)+" ";
               }
               if (checkNull.equals(key)){
                    sql=sql+modelMap.get(key)+" ";               }
               if (checkUnique.equals(key)){
                   sql=sql+modelMap.get(key)+");";
               }
               reg=campo+tipoVar+checkPrimary+checkNull+checkUnique;
           }
            
            
            
            
         
         out.print(sql);
         //out.print(te);
        }
         
    %>
<p>${te}</p>
</div>

<jsp:include page="../footer.jsp" />
