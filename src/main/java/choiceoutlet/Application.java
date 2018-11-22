package choiceoutlet;

import java.io.File;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;

import choiceoutlet.controller.ChoiceController;

@SpringBootApplication
public class Application {

	public static void main(String[] args) {
		new File(ChoiceController.uploadDirectory).mkdir();
		// TODO Auto-generated method stub
		  SpringApplication.run(Application.class, args);
	}
	
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
            registry.addResourceHandler("/resources/**")
                    .addResourceLocations("/resources/");
    }
}
