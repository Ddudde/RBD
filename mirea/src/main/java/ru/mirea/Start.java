package ru.mirea;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.SceneAntialiasing;
import javafx.scene.image.Image;
import javafx.stage.Stage;
import javafx.stage.WindowEvent;
import lombok.extern.slf4j.Slf4j;
import ru.mirea.Controllers.ModelController;
import ru.mirea.Controllers.StartController;
import ru.mirea.data.User;
import ru.mirea.data.DataImpl;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.*;

@Slf4j
public class Start extends Application {

    public static Map<String, Object> roots;

    public static FXMLLoader loader;

    public static Stage primStage;

    public static String usename;

    public static String path = System.getenv("APPDATA") + "\\CompMagaz\\data1";

    public static List<String> off_replace = new ArrayList<>();

    public static List<String> off_save = new ArrayList<>();

    public static List<String> off_reg = new ArrayList<>();

    @Override
    public void start(Stage primaryStage) throws IOException {
        primStage = primaryStage;
        primStage.getIcons().add(new Image(getClass().getResourceAsStream("/img/rsl-logo.png")));
        primStage.setTitle("Приложение «Российская государственная библиотека»");
        primStage.setResizable(false);
        //load_users();
        //load_commands();
        start_scene("/fxml/start.fxml");
        ((StartController)loader.getController()).onLogos();
        //starts();
        start_spring();
        //close_start();
        //start_scene("/fxml/project.fxml");
        //((ProjController)loader.getController()).init();
    }

    private static List<Integer> cont(List<String> list, String log)
    {
        List<Integer> mas = new ArrayList<>();
        int id = 1;
        for(String str : list)
        {
            if (Objects.equals(str, log)) mas.add(id);
            id++;
        }
        return mas;
    }

    public static void start_scene(String path) throws IOException {
        loader = new FXMLLoader();
        loader.setLocation(Start.class.getResource(path));
        primStage.setScene(new Scene(loader.load(), 1280, 720, true, SceneAntialiasing.DISABLED));
        roots = loader.getNamespace();
        primStage.show();
        primStage.setOnCloseRequest(Start::close);
    }

    private static void close(WindowEvent event) {
        try {
            if (!Files.exists(Paths.get(path))) new File(path).mkdirs();
            PrintWriter out = new PrintWriter(path + "\\users");
            for(User user : DataImpl.map.values()) out.println(user.toSave());
            out.flush();
            out.close();
            out = new PrintWriter(path + "\\commands");
            out.println(off_replace);
            out.println(off_save);
            out.println(off_reg);
            out.flush();
            out.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        System.exit(0);
    }

    public static void agree_with_bd()
    {
        DataImpl dataImpl = (DataImpl) MireaApplication.ctx.getBean("usersImpl");
        int id = 0;
        Map<String, User> map = new HashMap<>();
        Map<String, User> map1 = new HashMap<>();
        User user;
        List<String> on_reg = new ArrayList<>();
        for(String log : off_reg) {
            user = DataImpl.map.get(log);
            if(dataImpl.getuser(log) == null)
            {
                dataImpl.addorsave(user);
                on_reg.add(user.getUsername());
            }
        }
        user = null;
        String lg = null;
        for(int i = 0; i < off_replace.size(); i++) {
            String log = off_replace.get(i);
            if(lg == null) {
                lg = log;
                continue;
            }
            if(log == null) break;
            List<Integer> list = cont(off_replace, log);
            boolean mod = list.get(0) % 2 == 0;
            boolean rem = false;
            for(int df : list)
            {
                if(mod && !(df % 2 == 0))
                {
                    Collections.replaceAll(off_replace, log, lg);
                    rem = true;
                }
            }
            lg = off_replace.get(i);
            while (off_replace.indexOf(lg) != off_replace.lastIndexOf(lg) && rem) off_replace.remove(lg);
        }
        for(String log : off_replace) {
            switch (id) {
                case 0 -> {
                    if(!off_reg.contains(log) || on_reg.contains(log)) user = dataImpl.getuser(log);
                    if(user == null) {
                        if (map.containsKey(log))
                            user = map.get(log);
                        else user = DataImpl.map.get(log);
                    }
                    if(user != null) map.put(log, user);
                }
                case 1 -> {
                    User user1 = DataImpl.map.get(log);
                    if(user1 != null) {
                        user.setId(0);
                        user.setCh_u(Objects.equals(user.getUsername(), user1.getUsername()));
                        user.setId(user1.getId());
                        String log1 = user.getUsername();
                        user.setUsername(user1.getUsername());
                        user.setPassword(user1.getPassword());
                        user.setIcons(user1.getIcons());
                        //user.setSohr(user1.getSohr());
                        map.put(log, user);
                        map1.put(log1, user);
                    }
                    id = 0;
                    user = null;
                    continue;
                }
            }
            id++;
        }
        ModelController controller = loader.getController();
        for(String log : off_reg) {
            System.out.println(!on_reg.contains(log) + " " + !map1.containsKey(log));//!cont(map1, log));
            if (!on_reg.contains(log) && !map1.containsKey(log)) {
                controller.neWarn(controller.ernull);
                controller.neWarn(controller.erpat);
                controller.neWarn(controller.gen);
                controller.time_reg.setText(new SimpleDateFormat("HH:mm").format(new Date()));
                controller.onWarn(controller.net_reg);
                controller.setPer_reg(log);
                break;
            }
        }
        for(Map.Entry<String, User> entry : map1.entrySet()) {
            User us = entry.getValue();
            if (dataImpl.getuser(us.getUsername()) != null) {
                if(!us.isCh_u()) {
                    controller.neWarn(controller.ernull);
                    controller.neWarn(controller.erpat);
                    controller.neWarn(controller.gen);
                    map1.remove(entry.getKey());
                    controller.time_rep.setText(new SimpleDateFormat("HH:mm").format(new Date()));
                    controller.onWarn(controller.net_rep);
                    controller.setPer_rep(us.getUsername());
                    break;
                } else {
                    off_save.add(entry.getKey());
                    map1.remove(entry.getKey());
                }
            }
        }
        for(Map.Entry<String, User> entry : map1.entrySet()) {
            User us = entry.getValue();
            if (dataImpl.getuser(us.getUsername()) == null)
            {
                if(!us.isCh_u()) {
                    User us1 = dataImpl.getuser(entry.getKey());
                    if(us1 != null)
                    {
                        us1.setUsername(us.getUsername());
                        us1.setPassword(us.getPassword());
                        us1.setIcons(us.getIcons());
                        //us1.setSohr(us.getSohr());
                        dataImpl.addorsave(us1);
                    } else dataImpl.addorsave(us);
                    map1.remove(entry.getKey());
                }
            }
        }
        off_replace.clear();
        for(Map.Entry<String, User> entry : map1.entrySet()) {
            off_replace.addAll(List.of(entry.getKey(), entry.getValue().getUsername()));
        }
        for(String log : off_save) {
            User user1 = dataImpl.getuser(log);
            if(map.containsKey(log))
                user = map.get(log);
            else
                user = user1 != null ? user1 : dataImpl.getuser(log);
            //user1.setSohr(user.getSohr());
            dataImpl.addorsave(user1);
        }
        off_save.clear();
    }

    private static boolean cont(Map<String, User> map, String log)
    {
        boolean a = false;
        for(User user : map.values())
        {
            if (Objects.equals(user.getUsername(), log)) {
                a = true;
                System.out.println(user.getUsername() + " " + log);
                break;
            }
        }
        return a;
    }

    private void load_commands()
    {
        try {
            int id = 0;
            for(String str : Files.readAllLines(Paths.get(path + "\\commands"), StandardCharsets.UTF_8))
            {
                str = str.replace("[", "").replace("]", "");
                if(str.isEmpty())
                {
                    id++;
                    continue;
                }
                switch (id) {
                    case 0 -> off_replace.addAll(List.of(str.split(", ")));
                    case 1 -> off_save.addAll(List.of(str.split(", ")));
                    case 2 -> off_reg.addAll(List.of(str.split(", ")));
                }
                id++;
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void load_users()
    {
        try {
            int id = 0;
            User newuser = new User();
            for(String str : Files.readAllLines(Paths.get(path + "\\users"), StandardCharsets.UTF_8))
            {
                switch (id) {
                    case 0 -> newuser.setId(Integer.parseInt(str));
                    case 1 -> newuser.setUsername(str);
                    case 2 -> newuser.setPassword(str);
                    case 3 -> newuser.setIcons(Integer.parseInt(str));
                    case 4 -> {
                        //newuser.setSohr(Integer.parseInt(str));
                        id = 0;
                        DataImpl.map.put(newuser.getUsername(), newuser);
                        newuser = new User();
                        continue;
                    }
                }
                id++;
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void start_spring()
    {
        new StartSpring(new SetCtx()).start();
    }

    public static void starts() {
        ((StartController)loader.getController()).init();
    }

    public static void close_start()
    {
        primStage.close();
    }

    public static void close_project()
    {
        primStage.close();
    }
}
