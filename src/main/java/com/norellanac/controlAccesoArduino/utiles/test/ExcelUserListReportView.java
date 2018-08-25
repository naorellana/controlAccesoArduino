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
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.servlet.view.document.AbstractXlsView;

//import com.jackrutorial.model.User;


public class ExcelUserListReportView extends AbstractXlsView {
    private JdbcTemplate jdbcTemplate;
    public ExcelUserListReportView()
    {
        Conectar con=new Conectar();
        this.jdbcTemplate=new JdbcTemplate(con.conectar());
    }

 @Override
 protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
   HttpServletResponse response) throws Exception {
  
  response.setHeader("Content-disposition", "attachment; filename=\"user_list.xls\"");
  
  @SuppressWarnings("unchecked")
  List<Usuarios> list= (List<Usuarios>) model.get("userList");
  
  Sheet sheet = workbook.createSheet("User List");
  
  Row header = sheet.createRow(0);
  header.createCell(0).setCellValue("id");
  header.createCell(1).setCellValue("nombre");
  header.createCell(2).setCellValue("correo");
  header.createCell(3).setCellValue("telefono");
  
  int rowNum = 1;
  
  for(Usuarios user : list){
   Row row = sheet.createRow(rowNum++);
   row.createCell(0).setCellValue(user.getId());
   row.createCell(1).setCellValue(user.getNombre());
   row.createCell(2).setCellValue(user.getCorreo());
   row.createCell(3).setCellValue(user.getTelefono());
  }
  
 }

}