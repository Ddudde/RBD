package ru.mirea;

import javafx.application.Application;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
public class MireaApplication {

	public static ConfigurableApplicationContext ctx;

	public static void main(String[] args) {
		System.setProperty("java.awt.headless", "false");
		Application.launch(Start.class);
	}

}