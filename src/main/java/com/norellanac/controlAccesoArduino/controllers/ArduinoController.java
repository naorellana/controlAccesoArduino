
package com.norellanac.controlAccesoArduino.controllers;



import com.norellanac.controlAccesoArduino.utiles.serialComArduino;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ArduinoController {
    //@Autowired	

    @GetMapping("/inicio1")
	public String init(HttpServletRequest req) {
                return "index";
	}
    @GetMapping("/control")
	public void delete(@RequestParam String motor, HttpServletRequest req, HttpServletResponse resp) throws IOException {
                //String sql="select * from usuarios order by id desc";
                //List usuarios=this.jdbcTemplate.queryForList(sql);
		//req.setAttribute("usuarios",usuarios);
                System.out.println("Comando: "+ motor);
                serialComArduino comArduino= new serialComArduino();
        comArduino.enviaDatoArduino(motor);
                resp.sendRedirect("/inicio1");
                
        }

    
}
