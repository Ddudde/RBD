package ru.app;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;

@SpringBootApplication
public class Application {

	public static ConfigurableApplicationContext ctx;

	public static void main(String[] args) {
		System.setProperty("java.awt.headless", "false");
		javafx.application.Application.launch(Start.class);
	}

}