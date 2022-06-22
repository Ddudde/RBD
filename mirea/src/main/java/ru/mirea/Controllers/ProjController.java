package ru.mirea.Controllers;

import javafx.animation.KeyValue;
import javafx.beans.value.ObservableValue;
import javafx.fxml.FXML;
import javafx.scene.Cursor;
import javafx.scene.Node;
import javafx.scene.control.Label;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.scene.effect.DropShadow;
import javafx.scene.effect.Glow;
import javafx.scene.effect.InnerShadow;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.input.KeyCode;
import javafx.scene.input.KeyEvent;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.HBox;
import javafx.scene.layout.Pane;
import javafx.scene.layout.VBox;
import javafx.scene.paint.Color;
import javafx.scene.text.Font;
import javafx.scene.text.FontWeight;
import javafx.scene.web.WebEngine;
import javafx.scene.web.WebView;
import org.springframework.transaction.annotation.Transactional;
import ru.mirea.MireaApplication;
import ru.mirea.Start;
import ru.mirea.data.model.Autor_po_kniggam;
import ru.mirea.data.model.Knigga;
import ru.mirea.data.model.User;
import ru.mirea.data.DataImpl;

import java.awt.Toolkit;
import java.awt.Desktop;
import java.io.*;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class ProjController extends ModelController{

    private int id = 1;

    public DataImpl dataImpl;

    @FXML
    private Label usern;

    @FXML
    private ImageView icon;

    @FXML
    private Pane glavn;

    @FXML
    private Pane news;

    @FXML
    private Pane cont;

    @FXML
    private VBox menu;

    @FXML
    private Pane edit;

    @FXML
    private Pane caps;

    @FXML
    private Pane p_edit;

    @FXML
    private TextField log;

    @FXML
    private PasswordField par;

    private User user;

    @FXML
    private Pane logzan;

    @FXML
    private HBox nav;

    @FXML
    private Pane BN;

    @FXML
    private Pane BC;

    @FXML
    private Pane BM;

    @FXML
    private WebView webmap;

    @FXML
    private Label l_cat;

    @FXML
    private VBox vb_cat;

    private boolean caps_lock = false;

    private Pane act_pane;

    private int next_id = -1;

    private int node = 0;

    private User rep_us;

    public void init()
    {
        dataImpl = (DataImpl) MireaApplication.ctx.getBean("dataImpl");
        //user = dataImpl.getuser("Zuani");
        //System.out.println("Pr: " + user.getPassword());
        if(user != null)
        {
            usern.setText(Start.usename);
            log.setText(Start.usename);
            par.setText(user.getPassword());
            set_ico();
            //if(user.getSohr() > 1) next_id = user.getSohr();
        }
        if(next_id == -1)
        {
            for(Node node : nav.getChildren()) node.setOpacity(0);
        }
        caps_lock = Toolkit.getDefaultToolkit().getLockingKeyState(java.awt.event.KeyEvent.VK_CAPS_LOCK);
        set_caps();
        act_pane = (Pane) Start.roots.get("id_" + id);
        p_edit.getScene().addEventHandler(KeyEvent.KEY_RELEASED, this::caps);
        //toMain();
        if(next_id == -1) onNavV();
        //super.init();
        WebEngine webEngine = webmap.getEngine();
        webEngine.load("https://yandex.ru/map-widget/v1/?um=constructor%3Abbe1c6998b6c380aa3d4725123f54d465d8f43861aa738b01acfa6bae8219955&amp;source=constructor");
        ini_cat();
    }

    private void ini_cat()
    {
        vb_cat.getChildren().clear();
        for(Knigga knigga : dataImpl.getAllKniggas())
        {
            if(knigga.getNazv() == null) continue;
            Autor_po_kniggam autor = dataImpl.getAutor_po_kniggamById(knigga.getId_author());
            String author = autor.getLast_name() + ", " + autor.getName() + " " + autor.getPatronymic() + ".";
            StringBuilder zhanr = new StringBuilder(dataImpl.getThemeById(knigga.getId_tem()).getNazv());
            for(Knigga kn : dataImpl.getAllKniggasById_id(knigga.getId()))
            {
                zhanr.append(", ").append(dataImpl.getThemeById(kn.getId_tem()).getNazv());
            }
            vb_cat.getChildren().add(getNewKnigga(author, knigga.getNazv(), knigga.getIzd(), zhanr.toString(), knigga.getPrev()));
        }
    }

    private Pane getNewKnigga(String author, String name, String izd, String zhanr, String url)
    {
        Pane pane = new Pane();
        pane.setPrefSize(465,175);
        pane.setCursor(Cursor.HAND);
        pane.getStylesheets().add("/css/upanel.css");
        pane.getStyleClass().add("panel");
        pane.setEffect(new DropShadow(10, Color.web("#ff9500",0)));
        ImageView imageView = new ImageView(url);
        imageView.relocate(15,10);
        imageView.setFitWidth(110);
        imageView.setFitHeight(155);
        imageView.setEffect(new DropShadow(10, 3, 3, Color.web("#000000",1)));
        Label label = new Label(author);
        label.setFont(Font.font("Arial", FontWeight.BOLD, 18));
        label.relocate(135, 10);
        Label label1 = new Label(name);
        label1.setFont(Font.font("Arial", FontWeight.BOLD, 14));
        label1.relocate(135, 35);
        Label label2 = new Label(izd);
        label2.setFont(Font.font("Arial", FontWeight.NORMAL, 14));
        label2.relocate(135, 55);
        Label label3 = new Label("Жанр(ы): " + zhanr);
        label3.setFont(Font.font("Arial", FontWeight.NORMAL, 14));
        label3.setWrapText(true);
        label3.relocate(135, 71);
        label3.setPrefSize(325,95);
        pane.getChildren().add(imageView);
        pane.getChildren().add(label);
        pane.getChildren().add(label1);
        pane.getChildren().add(label2);
        pane.getChildren().add(label3);
        return pane;
    }

    public void browse_3535() throws URISyntaxException, IOException {
        Desktop d = Desktop.getDesktop();
        d.browse(new URI("tel:+78005553535"));
    }

    public void browse_0088() throws URISyntaxException, IOException {
        Desktop d = Desktop.getDesktop();
        d.browse(new URI("tel:+53535550088"));
    }

    private void set_ico()
    {
        ico = user.getIcons();
        icon.setImage(new Image(getClass().getResourceAsStream("/img/ls-icon" + (ico + 1) + ".png")));
        switch (ico) {
            case 0 -> ra1.setSelected(true);
            case 1 -> ra2.setSelected(true);
            case 2 -> ra3.setSelected(true);
        }
    }

    public void next_list()
    {
        /*if(next_id > 1)
        {
            id = next_id;
            next_id = -1;
        } else id++;
        act_pane.setVisible(false);
        if(scene3D != null && act_pane.getChildren().size() > 2)
        {
            Pane view3d = (Pane) act_pane.getChildren().get(2);
            view3d.getChildren().remove(scene3D);
            scene3D.destroy();
        }
        act_pane = (Pane) Start.roots.get("id_" + id);
        act_pane.setVisible(true);
        if(act_pane.getChildren().size() > 2) {
            Pane view3d = (Pane) act_pane.getChildren().get(2);
            if(scene3D == null)
                scene3D = new Scene3D(view3d.getId());
            else
                scene3D.undestroy(view3d.getId());
            view3d.getChildren().add(scene3D.getScene());
        }
        user.setSohr(id);
        if(!ModelController.inet) Start.off_save.add(user.getUsername());
        usersImpl.addorsave(user);
        */
    }

    private void caps(KeyEvent keyEvent)
    {
        if(keyEvent.getCode() == KeyCode.CAPS) {
            caps_lock = !caps_lock;
            set_caps();
        }
    }

    private void set_caps()
    {
        caps.setVisible(caps_lock);
    }

    private void upd_str()
    {
        glavn.setVisible(false);
        news.setVisible(false);
        cont.setVisible(false);
        edit.setVisible(false);
        ernull.setVisible(false);
        erpat.setVisible(false);
        gen.setVisible(false);
        if(erpat.getParent() != null) ((Pane)erpat.getParent()).getChildren().remove(erpat);
        if(ernull.getParent() != null) ((Pane)ernull.getParent()).getChildren().remove(ernull);
        if(gen.getParent() != null) ((Pane)gen.getParent()).getChildren().remove(gen);
        nePN(newEvent(BN));
        nePN(newEvent(BC));
        nePN(newEvent(BM));
    }

    private MouseEvent newEvent(Object obj)
    {
        return new MouseEvent(obj, null, null, 0,0,0,0, null,0,false,false,false,false,false,false,false,false,false,false,false,false,null);
    }

    public void toNews()
    {
        upd_str();
        news.setVisible(true);
        onPN(newEvent(BN));
    }

    public void toContact()
    {
        upd_str();
        cont.setVisible(true);
        onPN(newEvent(BC));
    }

    public void toMain()
    {
        upd_str();
        glavn.setVisible(true);
        onPN(newEvent(BM));
    }

    public void toEdit()
    {
        upd_str();
        edit.setVisible(true);
    }

    public void toEdit(User user)
    {
        upd_str();
        edit.setVisible(true);
        logzan.setVisible(true);
        rep_us = user;
    }

    public void onEnter(KeyEvent keyEvent) {
        if(keyEvent.getCode() == KeyCode.ENTER) onedit();
    }

    private void onNavV()
    {
        List<KeyValue> kv = new ArrayList<>();
        if(node == nav.getChildren().size() - 1) onUser1();
        if(node <= nav.getChildren().size() - 1)
        {
            Node nod = nav.getChildren().get(node);
            onNav(newEvent(nod));
            kv.add(new KeyValue(nod.opacityProperty(), 1.0, inter));
            kv.add(new KeyValue(nod.mouseTransparentProperty(), true, inter));
            nod.mouseTransparentProperty().addListener(this::changed);
        }
        played(kv, 1000);
    }

    private void changed(ObservableValue<? extends Boolean> ov, Boolean old_val, Boolean new_val) {
        if(new_val)
        {
            Node nod = nav.getChildren().get(node);
            if(node == nav.getChildren().size() - 1) neUser();
            neNav(newEvent(nod));
            nod.mouseTransparentProperty().removeListener(this::changed);
            nod.setMouseTransparent(false);
            node++;
            onNavV();
        }
    }

    public void onNav(MouseEvent mouseEvent)
    {
        Label label = getLabel(mouseEvent.getSource());
        Glow glow = (Glow) label.getEffect();
        List<KeyValue> kv = new ArrayList<>();
        kv.add(new KeyValue(glow.levelProperty(), 1.0, inter));
        played(kv, 200);
    }

    public void neNav(MouseEvent mouseEvent)
    {
        Label label = getLabel(mouseEvent.getSource());
        Glow glow = (Glow) label.getEffect();
        List<KeyValue> kv = new ArrayList<>();
        kv.add(new KeyValue(glow.levelProperty(), 0, inter));
        played(kv, 200);
    }

    public void onUser(MouseEvent mouseEvent)
    {
        onNav(mouseEvent);
        onUser1();
    }

    public void onUser1()
    {
        menu.setVisible(true);
        List<KeyValue> kv = new ArrayList<>();
        kv.add(new KeyValue(menu.opacityProperty(), 1, inter));
        kv.add(new KeyValue(menu.layoutYProperty(), 0, inter));
        for(Node node : menu.getChildren()) kv.add(new KeyValue(node.mouseTransparentProperty(), false, inter));
        played(kv, 500);
    }

    public void neUser()
    {
        List<KeyValue> kv = new ArrayList<>();
        kv.add(new KeyValue(menu.layoutYProperty(), -175, inter));
        kv.add(new KeyValue(menu.opacityProperty(), 0, inter));
        kv.add(new KeyValue(menu.visibleProperty(), false, inter));
        for(Node node : menu.getChildren()) kv.add(new KeyValue(node.mouseTransparentProperty(), true, inter));
        played(kv, 500);
    }

    public void onPN(MouseEvent mouseEvent)
    {
        Label label = getLabel(mouseEvent.getSource());
        InnerShadow innerShadow = (InnerShadow) ((DropShadow)((Glow)label.getEffect()).getInput()).getInput();
        List<KeyValue> kv = new ArrayList<>();
        kv.add(new KeyValue(innerShadow.chokeProperty(), 0.3, inter));
        played(kv, 100);
    }

    public void nePN(MouseEvent mouseEvent)
    {
        Label label = getLabel(mouseEvent.getSource());
        InnerShadow innerShadow = (InnerShadow) ((DropShadow)((Glow)label.getEffect()).getInput()).getInput();
        List<KeyValue> kv = new ArrayList<>();
        kv.add(new KeyValue(innerShadow.chokeProperty(), 0, inter));
        played(kv, 100);
    }

    private Label getLabel(Object obj)
    {
        if(obj.getClass().getSimpleName().equals("Pane")) {
            Pane pane = (Pane) obj;
            return (Label) pane.getChildren().get(0);
        } else {
            return usern;
        }
    }

    public void onedit()
    {
        boolean stat1 = getstat(log);
        boolean stat2 = getstat(par);
        if(stat1 && stat2)
        {
            System.out.println(log.getText() + " " + dataImpl.getuser(log.getText()));
            if(dataImpl.getuser(log.getText()) != null && !Objects.equals(user.getUsername(), log.getText()))
            {
                logzan.setVisible(true);
                return;
            }
            logzan.setVisible(false);
            if(!ModelController.inet) Start.off_replace.addAll(List.of(Start.usename, log.getText()));
            DataImpl.map.remove(Start.usename);
            Start.usename = log.getText();
            if(rep_us == null) {
                user.setUsername(log.getText());
                user.setPassword(par.getText());
                user.setIcons(ico);
                dataImpl.addorsave(user);
                usern.setText(Start.usename);
                set_ico();
                toMain();
            } else {
                rep_us.setUsername(log.getText());
                rep_us.setPassword(par.getText());
                rep_us.setIcons(ico);
                dataImpl.addorsave(rep_us);
                usern.setText(Start.usename);
                set_ico();
                toMain();
                neWarn(net_rep);
                rep_us = null;
            }
        }
    }

    public void toBegin() throws IOException {
        Start.usename = null;
        Start.close_project();
        Start.start_scene("/fxml/start.fxml");
        Start.starts();
        StartController startController = Start.loader.getController();
        startController.setPer_rep(per_rep);
        startController.setPer_reg(per_reg);
        if(this.net_rep.isVisible()) startController.onWarn(startController.net_rep);
        if(this.net_reg.isVisible()) startController.onWarn(startController.net_reg);
    }

    public void ranpar()
    {
        ranpar(new PasswordField[]{par});
    }
}
