/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.norellanac.controlAccesoArduino.controllers;

import com.norellanac.controlAccesoArduino.models.Conectar;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author ORELLANA CUY
 */
@Controller
public class ReportCoontroller {
    
    private JdbcTemplate jdbcTemplate;
    public ReportCoontroller()
    {
        Conectar con=new Conectar();
        this.jdbcTemplate=new JdbcTemplate(con.conectar());
    }
    
    @GetMapping("/ingresos")
	public String reporte(HttpServletRequest req) {
                String sql="select * from ingresos_per order by id desc";
                List datos=this.jdbcTemplate.queryForList(sql);
		req.setAttribute("datos",datos);
		//req.setAttribute("mode", "BOOK_VIEW");
		return "/reportes/reporte_ing";
	}
        
        @GetMapping("/reportes")
	public String form(HttpServletRequest req) {
                String sql="select * from ingresos_per order by id desc";
                List datos=this.jdbcTemplate.queryForList(sql);
		req.setAttribute("datos",datos);
		//req.setAttribute("mode", "BOOK_VIEW");
		return "/reportes/formReport";
	}
        
        @GetMapping("/fechas")
	public String fechas(@RequestParam String fecha1, String fecha2,HttpServletRequest req) {
                String sql="SELECT ingresos_per.id,usuarios.nombre,  ingresos_per.fecha, ingresos_per.hora, ingresos_per.observacion FROM usuarios, ingresos_per "
                        + "WHERE ingresos_per.usuario_id =usuarios.id  and  ingresos_per.fecha BETWEEN '"+fecha1+"' AND '"+fecha2+"' order by id desc";
                List datos=this.jdbcTemplate.queryForList(sql);
		req.setAttribute("datos",datos);
		//req.setAttribute("mode", "BOOK_VIEW");
		return "/reportes/reporte_fech";
	}
        
        @GetMapping("/mes")
	public String mes(@RequestParam int mes, HttpServletRequest req) {
                String sql="SELECT ingresos_per.id,usuarios.nombre,  ingresos_per.fecha, ingresos_per.hora, ingresos_per.observacion FROM usuarios, ingresos_per "
                        + "WHERE ingresos_per.usuario_id =usuarios.id  and  ingresos_per.fecha BETWEEN '2018-0"+mes+"-01' AND '2018-0"+mes+"-31' order by id desc";
                List datos=this.jdbcTemplate.queryForList(sql);
		req.setAttribute("datos",datos);
		//req.setAttribute("mode", "BOOK_VIEW");
		return "/reportes/reporte_fech";
	}
        
        @GetMapping("/usuariodata")
	public String usuariodata(@RequestParam int id, HttpServletRequest req) {
                String sql="SELECT ingresos_per.id,usuarios.nombre,  ingresos_per.fecha, ingresos_per.hora, ingresos_per.observacion FROM usuarios, ingresos_per "
                        + "WHERE ingresos_per.usuario_id =usuarios.id  and usuarios.id="+id+" order by id desc";
                List datos=this.jdbcTemplate.queryForList(sql);
		req.setAttribute("datos",datos);
                req.setAttribute("rol","../header_adm.jsp");
		//req.setAttribute("mode", "BOOK_VIEW");
		return "/reportes/reporte_fech";
	}
        
        @GetMapping("/clienteData")
	public String clienteData(@RequestParam int id, HttpServletRequest req) {
                String sql="SELECT ingresos_per.id,usuarios.nombre,  ingresos_per.fecha, ingresos_per.hora, ingresos_per.observacion FROM usuarios, ingresos_per "
                        + "WHERE ingresos_per.usuario_id =usuarios.id  and usuarios.id="+id+" order by id desc";
                List datos=this.jdbcTemplate.queryForList(sql);
		req.setAttribute("datos",datos);
                req.setAttribute("rol","../header_usr.jsp");
		//req.setAttribute("mode", "BOOK_VIEW");
		return "/reportes/reporte_fech";
	}
    
}
