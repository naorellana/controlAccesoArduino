/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.norellanac.controlAccesoArduino.utiles.test;

/**
 *
 * @author norellanac
 */
import com.norellanac.controlAccesoArduino.models.Conectar;
import com.norellanac.controlAccesoArduino.models.Usuarios;
import com.norellanac.controlAccesoArduino.models.ingresos_per;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.jdbc.core.JdbcTemplate;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping(value="/")
public class ReportController {
    
     private JdbcTemplate jdbcTemplate;
    public ReportController()
    {
        Conectar con=new Conectar();
        this.jdbcTemplate=new JdbcTemplate(con.conectar());
    }
 
 @RequestMapping(value="/report", method=RequestMethod.GET)
 public ModelAndView userListReport(HttpServletRequest req, HttpServletResponse res){
     
     
     //datos norellanac
     String sql="SELECT usuarios.id,usuarios.nombre,  usuarios.correo, usuarios.telefono FROM usuarios ";
                List datos=this.jdbcTemplate.queryForList(sql);
                
    List<Usuarios> list = new ArrayList<Usuarios>();
                
                for (int i=0; i<datos.size();i++){
                    String[] parts = datos.get(i).toString().split(",");
                    list.add(new Usuarios(
                Integer.parseInt(parts[0].substring(4,5)), 
                parts[1].substring(8,parts[1].length()), 
                parts[2].substring(8,parts[2].length()), 
                parts[3].substring(10,parts[3].length()-1)));
                }
                
     
  String typeReport = req.getParameter("type");
  
//  List<Usuarios> list = new ArrayList<Usuarios>();
//  list.add(new Usuarios(1, "username 1", "First name 1", "Last name 1"));
//  list.add(new Usuarios(2, "username 2", "First name 2", "Last name 2"));
//  list.add(new Usuarios(3, "username 3", "First name 3", "Last name 3"));
//  list.add(new Usuarios(4, "username 4", "First name 4", "Last name 4"));
//  list.add(new Usuarios(5, "username 5", "First name 5", "Last name 5"));
  
  if(typeReport != null && typeReport.equals("xls")){
   return new ModelAndView(new ExcelUserListReportView(), "userList", list);
  } /*else if(typeReport != null && typeReport.equals("pdf")){
   return new ModelAndView(new PdfUserListReportView(), "userList", list);
  }*/
  
  return new ModelAndView("userListReport", "userList", list);
 }
 
 @RequestMapping(value="/excelMes", method=RequestMethod.GET)
 public ModelAndView RepInEx(HttpServletRequest req, HttpServletResponse res){
     String typeReport = req.getParameter("type");
  String mes = req.getParameter("mes");
    String sql="SELECT usuarios.nombre,  ingresos_per.fecha, ingresos_per.hora, ingresos_per.observacion FROM usuarios, ingresos_per "
                        + "WHERE ingresos_per.usuario_id =usuarios.id  and  ingresos_per.fecha BETWEEN '2018-0"+mes+"-01' AND '2018-0"+mes+"-31' ";
                List datos=this.jdbcTemplate.queryForList(sql);
                
    List<Usuarios> list = new ArrayList<Usuarios>();
                System.out.println(datos.get(0).toString());
                for (int i=0; i<datos.size();i++){
                    String[] parts = datos.get(i).toString().split(",");
                    list.add(new Usuarios(
                parts[0].substring(0,5), 
                parts[1].substring(8,parts[1].length()), 
                parts[2].substring(8,parts[2].length()), 
                parts[3].substring(10,parts[3].length()-1)));
                    System.out.println(datos.get(i).toString());
                }
                
     
  
  
//  List<Usuarios> list = new ArrayList<Usuarios>();
//  list.add(new Usuarios(1, "username 1", "First name 1", "Last name 1"));
//  list.add(new Usuarios(2, "username 2", "First name 2", "Last name 2"));
//  list.add(new Usuarios(3, "username 3", "First name 3", "Last name 3"));
//  list.add(new Usuarios(4, "username 4", "First name 4", "Last name 4"));
//  list.add(new Usuarios(5, "username 5", "First name 5", "Last name 5"));
  
  if(typeReport != null && typeReport.equals("xls")){
   return new ModelAndView(new ExcelUserListReportView(), "userList", list);
  } /*else if(typeReport != null && typeReport.equals("pdf")){
   return new ModelAndView(new PdfUserListReportView(), "userList", list);
  }*/
  
  return new ModelAndView("userListReport", "userList", list);
 }
 
 
 
 
}