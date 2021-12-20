package ru.mirea;

import javafx.application.Platform;
import org.springframework.context.ConfigurableApplicationContext;

public class SetCtx {

    private ConfigurableApplicationContext ct;

    private Start st;

    public SetCtx() {
    }

    public void setCt(ConfigurableApplicationContext ct1) {
        Platform.runLater(() -> {
            ct = ct1;
            MireaApplication.ctx = ct;
            Start.starts();
        });
    }
}
