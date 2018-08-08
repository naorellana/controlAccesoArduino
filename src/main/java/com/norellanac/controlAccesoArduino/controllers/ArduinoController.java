
package com.norellanac.controlAccesoArduino.controllers;



import com.norellanac.controlAccesoArduino.models.Conectar;
import com.norellanac.controlAccesoArduino.utiles.arduinoRecibe2EnviaString;
import com.norellanac.controlAccesoArduino.utiles.fechasNorellanac;
import com.norellanac.controlAccesoArduino.utiles.serialComArduino;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ArduinoController {
    //@Autowired	
    private  static JdbcTemplate jdbcTemplate;
    private static    Conectar con=new Conectar();
    fechasNorellanac fecha= new fechasNorellanac();
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
        
        @GetMapping("/test")
	public String test(HttpServletRequest req) {
                //req.setAttribute("datos",datos);
		//req.setAttribute("mode", "BOOK_VIEW");
		return "crudHuellaBETA";
	}
        
        @GetMapping("/beta")
	public void beta(@RequestParam String codigo, HttpServletRequest req, HttpServletResponse resp) throws IOException {
                //String sql="select * from usuarios order by id desc";
                //List usuarios=this.jdbcTemplate.queryForList(sql);
		//req.setAttribute("usuarios",usuarios);
                System.out.println("Comando: "+ codigo);
                System.out.println("El codigo enviado es: " +codigo);
                System.out.println(codigo.substring(0,1));
                System.out.println(Integer.parseInt(codigo.substring(2, codigo.length())));
                if (Integer.parseInt(codigo.substring(0,1))  ==3){
                    jdbcTemplate=new JdbcTemplate(con.conectar());
                        jdbcTemplate.update
                            (
                            "insert into ingresos_per (usuario_id,fecha,hora,marca,observacion ) values (?,?,?,?,?)",
                             Integer.parseInt(codigo.substring(2, codigo.length())),fecha.date(),fecha.time(),1,"ingresando desde java");
                }
                arduinoRecibe2EnviaString ard=new arduinoRecibe2EnviaString();
                
                 try
        {
            Thread.sleep(3000);
        }catch(InterruptedException e){}
                ard.enviarDato(codigo);
                resp.sendRedirect("/home");
                
        }

    
}
