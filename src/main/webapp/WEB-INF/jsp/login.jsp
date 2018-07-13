<%-- 
    Document   : login
    Created on : 14/02/2018, 01:57:42 PM
    Author     : naore
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" />
<div class="section">

      <!--   Icon Section   -->
      <div class="row">

        <div class="col s12 m6">
          <div class="icon-block">
            <h2 class="center light-blue-text"><i class="material-icons">group</i></h2>
            <h5 class="center">Login Or Register</h5>
            
            <div class="row">
    <form class="col s12">
      <div class="row">
        <div class="input-field col s6">
          <input placeholder="Placeholder" id="first_name" type="text" class="validate">
          <label for="first_name">First Name</label>
        </div>
        <div class="input-field col s6">
          <input id="last_name" type="text" class="validate">
          <label for="last_name">Last Name</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s12">
          <input id="password" type="password" class="validate">
          <label for="password">Password</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s12">
          <input id="email" type="email" class="validate">
          <label for="email">Email</label>
        </div>
      </div>
      <div class="row">
        <div class="col s12">
          <button class="btn waves-effect waves-light" type="submit" name="action">Submit
            <i class="material-icons right">send</i>
          </button>
        </div>
      </div>
    </form>
  </div>
            
          </div>
        </div>

        <div class="col s12 m6">
          <div class="icon-block">
            <h2 class="center light-blue-text"><i class="material-icons">group</i></h2>
            <h5 class="center">Login Or Register</h5>
            
            <div class="row">
    <form class="col s12" action="Autentication" method="post">
      <div class="row">
        <div class="input-field col s6">
          <input placeholder="Placeholder" id="user"  name="user" type="text" class="validate">
          <label for="user">user</label>
        </div>
          <div class="input-field col s6">
          <input id="pass" name="pass" type="password" class="validate">
          <label for="password">Password</label>
        </div>
      </div>
      <div class="row">
        
      </div>
      <div class="row">
        <div class="col s12">
          <button class="btn waves-effect waves-light" type="submit" name="action">Submit
            <i class="material-icons right">send</i>
          </button>
        </div>
      </div>
    </form>
  </div>
            
          </div>
        </div>
      </div>
<jsp:include page="footer.jsp" />
