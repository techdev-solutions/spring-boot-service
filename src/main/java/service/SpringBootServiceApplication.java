package service;

import org.springframework.boot.ApplicationPid;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.PostConstruct;
import java.io.File;
import java.io.IOException;

@RestController
@SpringBootApplication
public class SpringBootServiceApplication {

    @PostConstruct
    private void pid() throws IOException {
        File file = new File("application.pid");
        new ApplicationPid().write(file);
        file.deleteOnExit();
    }

    public static void main(String[] args) {
        SpringApplication.run(SpringBootServiceApplication.class, args);
    }
}
