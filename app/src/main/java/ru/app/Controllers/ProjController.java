package ru.app.Controllers;

import javafx.animation.KeyValue;
import javafx.application.Platform;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.fxml.FXML;
import javafx.scene.Cursor;
import javafx.scene.Node;
import javafx.scene.control.*;
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
import ru.app.Application;
import ru.app.Start;
import ru.app.data.DataImpl;
import ru.app.data.model.Autor_po_kniggam;
import ru.app.data.model.Knigga;
import ru.app.data.model.Them;
import ru.app.data.model.User;
import java.awt.Toolkit;
import java.awt.Desktop;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.regex.Pattern;

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
    private Pane abon;

    @FXML
    private Pane catal;

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
    private Pane BA;

    @FXML
    private Pane BC;

    @FXML
    private Pane BM;

    @FXML
    private Pane BK;

    @FXML
    private WebView webmap;

    @FXML
    private Label l_cat;

    @FXML
    private Label l_cat2;

    @FXML
    private Label empty_rez;

    @FXML
    private VBox vb_cat;

    @FXML
    private Button but_poisk;

    @FXML
    private TextField inp_nazv;

    @FXML
    private CheckBox check_filtr;

    @FXML
    private Pane pan_cat;

    @FXML
    private Pane pan_cat1;

    @FXML
    private Pane pan_filtr;

    @FXML
    private TextField inp_nach;

    @FXML
    private TextField inp_kon;

    @FXML
    private Pane pan_god;

    @FXML
    private Pane pan_zhanr;

    @FXML
    private ComboBox combo_zha;

    private boolean caps_lock = false;

    private Pane act_pane;

    private int next_id = -1;

    private boolean isPoisk = false;

    private boolean isRez = false;

    private boolean inp_nazv_false = true;

    private boolean inp_nach_false = true;

    private boolean inp_kon_false = true;

    private int node = 0;

    private User rep_us;

    protected final ArrayList<Pane> list_zhnr = new ArrayList<>();

    public void init()
    {
        dataImpl = (DataImpl) Application.ctx.getBean("dataImpl");
        user = dataImpl.getuser(Start.usename);
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
        reset_cat();
        for(Them them : dataImpl.getAllThemas()) {
            combo_zha.getItems().add(getNewTheme(them.getNazv()));
        }
        combo_zha.valueProperty().addListener((ChangeListener<Object>) (ov, t, t1) -> {
            if(t1 == null) return;
            if(t1.getClass().getSimpleName().equals("String")) return;
            Pane pane = (Pane) t1;
            if(list_zhnr.contains(pane)) {
                pane.getChildren().get(1).setVisible(false);
                list_zhnr.remove(pane);
                Platform.runLater(() -> {
                    combo_zha.setValue("");
                });
            }else{
                pane.getChildren().get(1).setVisible(true);
                list_zhnr.add(pane);
                Platform.runLater(() -> {
                    combo_zha.setValue(((Label) pane.getChildren().get(0)).getText());
                });
            }
            if(list_zhnr.isEmpty()) {
                freezeStateGod1 = false;
                nePan(newEvent(pan_zhanr));
                but_poisk.setDisable(inp_nazv_false && inp_kon_false && inp_nach_false && list_zhnr.isEmpty());
            }
            if(!list_zhnr.isEmpty()) {
                onPan(newEvent(pan_zhanr));
                but_poisk.setDisable(false);
                freezeStateGod1 = true;
            }
        });
    }

    private void changeIsRez()
    {
        isRez = !isRez;
        l_cat.setVisible(!isRez);
        l_cat2.setVisible(isRez);
    }

    private void changeIsPoisk()
    {
        isPoisk = !isPoisk;
        pan_cat.setVisible(!isPoisk);
        pan_cat1.setVisible(isPoisk);
    }

    private void ini_cat(String cat)
    {
        empty_rez.setVisible(false);
        Platform.runLater(() -> {
            vb_cat.getChildren().clear();
        });
        for(Knigga knigga : dataImpl.getAllKniggas())
        {
            if(knigga.getNazv() == null || !knigga.getNazv().contains(cat)
                    || (!inp_nach.getText().isEmpty() && knigga.getGod_izd() < Integer.parseInt(inp_nach.getText()))
                    || (!inp_kon.getText().isEmpty() && knigga.getGod_izd() > Integer.parseInt(inp_kon.getText())))
                continue;
            Autor_po_kniggam autor = dataImpl.getAutor_po_kniggamById(knigga.getId_author());
            String author = autor.getLast_name() + ", " + autor.getName() + " " + autor.getPatronymic() + ".";
            StringBuilder zhanr = new StringBuilder(dataImpl.getThemeById(knigga.getId_tem()).getNazv());
            for(Knigga kn : dataImpl.getAllKniggasById_id(knigga.getId()))
            {
                zhanr.append(", ").append(dataImpl.getThemeById(kn.getId_tem()).getNazv());
            }
            if(!list_zhnr.isEmpty())
            {
                boolean yes = false;
                for(Pane pane : list_zhnr)
                {
                    String thm = ((Label)pane.getChildren().get(0)).getText();
                    yes = zhanr.toString().contains(thm);
                }
                if(!yes) continue;
            }
            Platform.runLater(() -> {
                vb_cat.getChildren().add(getNewKnigga(author, knigga.getNazv(), knigga.getIzd() + ", " + knigga.getGod_izd() + "г.", zhanr.toString(), knigga.getPrev()));
            });
        }
        Platform.runLater(() -> {
            empty_rez.setVisible(vb_cat.getChildren().size() == 0);
        });
    }

    private Pane getNewTheme(String theme)
    {
        Pane pane = new Pane();
        pane.setPrefSize(150,40);
        Label label = new Label(theme);
        label.setWrapText(true);
        label.setPrefWidth(125);
        label.setFont(Font.font("Arial", FontWeight.NORMAL, 12));
        label.relocate(14, 12);
        ImageView imageView = new ImageView("\\img\\yes.png");
        imageView.relocate(141,5);
        imageView.setFitWidth(30);
        imageView.setFitHeight(30);
        imageView.setVisible(false);
        pane.getChildren().add(label);
        pane.getChildren().add(imageView);
        return pane;
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
        pane.setOnMouseEntered(this::onPan1);
        pane.setOnMouseExited(this::nePan1);
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
        abon.setVisible(false);
        catal.setVisible(false);
        cont.setVisible(false);
        edit.setVisible(false);
        ernull.setVisible(false);
        erpat.setVisible(false);
        ernenum.setVisible(false);
        gen.setVisible(false);
        if(erpat.getParent() != null) ((Pane)erpat.getParent()).getChildren().remove(erpat);
        if(ernenum.getParent() != null) ((Pane)ernenum.getParent()).getChildren().remove(ernenum);
        if(ernull.getParent() != null) ((Pane)ernull.getParent()).getChildren().remove(ernull);
        if(gen.getParent() != null) ((Pane)gen.getParent()).getChildren().remove(gen);
        nePA(newEvent(BA));
        nePA(newEvent(BC));
        nePA(newEvent(BM));
        nePA(newEvent(BK));
    }

    private MouseEvent newEvent(Object obj)
    {
        return new MouseEvent(obj, null, null, 0,0,0,0, null,0,false,false,false,false,false,false,false,false,false,false,false,false,null);
    }

    public void toAbon()
    {
        upd_str();
        abon.setVisible(true);
        onPA(newEvent(BA));
    }

    public void toContact()
    {
        upd_str();
        cont.setVisible(true);
        onPA(newEvent(BC));
    }

    public void toMain()
    {
        upd_str();
        glavn.setVisible(true);
        onPA(newEvent(BM));
    }

    public void toCat()
    {
        upd_str();
        catal.setVisible(true);
        onPA(newEvent(BK));
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

    public void onPA(MouseEvent mouseEvent)
    {
        Label label = getLabel(mouseEvent.getSource());
        InnerShadow innerShadow = (InnerShadow) ((DropShadow)((Glow)label.getEffect()).getInput()).getInput();
        List<KeyValue> kv = new ArrayList<>();
        kv.add(new KeyValue(innerShadow.chokeProperty(), 0.3, inter));
        played(kv, 100);
    }

    public void nePA(MouseEvent mouseEvent)
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

    public void onedit_poisk()
    {
        changeIsPoisk();
        if(!isRez) changeIsRez();
        inp_nazv.setDisable(true);
        but_poisk.setDisable(true);
        ExecutorService executorService = Executors.newScheduledThreadPool(1);
        executorService.execute(() -> {
            ini_cat(inp_nazv.getText());
            Platform.runLater(() -> {
                changeIsPoisk();
                inp_nazv.setDisable(false);
                but_poisk.setDisable(false);
                executorService.shutdown();
            });
        });
    }

    public void changeFilter()
    {
        if(check_filtr.isSelected())
        {
            pan_filtr.setVisible(true);
        }else{
            pan_filtr.setVisible(false);
        }
    }

    public void reset_cat()
    {
        changeIsPoisk();
        if(isRez) changeIsRez();
        inp_nazv.setDisable(true);
        but_poisk.setDisable(true);
        inp_nazv.setText("");
        ExecutorService executorService = Executors.newScheduledThreadPool(1);
        executorService.execute(() -> {
            ini_cat(inp_nazv.getText());
            Platform.runLater(() -> {
                changeIsPoisk();
                inp_nazv.setDisable(false);
                but_poisk.setDisable(true);
                freezeStateGod = false;
                freezeStateGod1 = false;
                nePan(newEvent(pan_god));
                nePan(newEvent(pan_zhanr));
                for(Pane pane : list_zhnr)
                {
                    pane.getChildren().get(1).setVisible(false);
                }
                list_zhnr.clear();
                combo_zha.setValue("");
                inp_nach.setText("");
                inp_kon.setText("");
                executorService.shutdown();
            });
        });
    }

    public void textchnull(KeyEvent keyEvent)
    {
        textchnull((TextField) keyEvent.getSource());
    }

    private void textchnull(TextField text)
    {
        if (text.getText().isEmpty())
        {
            if (!list_null.contains(text.getId())){
                add_null(text.getId());
                inp_nazv_false = true;
                but_poisk.setDisable(inp_kon_false && inp_nach_false && list_zhnr.isEmpty());
            }
        } else {
            rem_null(text.getId());
            inp_nazv_false = false;
            but_poisk.setDisable(false);
        }
    }

    public void textchnum(KeyEvent keyEvent)
    {
        TextField text = (TextField) keyEvent.getSource();
        if (text.getText().isEmpty())
        {
            if(text == inp_nach)
                inp_nach_false = true;
            else
                inp_kon_false = true;
            if(inp_kon_false == inp_nach_false) {
                freezeStateGod = false;
                nePan(newEvent(pan_god));
            }
            if (!list_null.contains(text.getId())) add_null(text.getId());
            if (list_nenum.contains(text.getId())) rem_nenum(text.getId());
            but_poisk.setDisable(inp_nazv_false && inp_kon_false && inp_nach_false && list_zhnr.isEmpty());
        } else {
            onPan(newEvent(pan_god));
            freezeStateGod = true;
            rem_null(text.getId());
            if (Pattern.matches("[0-9]+", text.getText())) {
                rem_nenum(text.getId());
                if(text == inp_nach)
                    inp_nach_false = false;
                else
                    inp_kon_false = false;
                but_poisk.setDisable(false);
            }
            else {
                if (!list_nenum.contains(text.getId())) {
                    add_nenum(text.getId());
                    if(text == inp_nach)
                        inp_nach_false = true;
                    else
                        inp_kon_false = true;
                    but_poisk.setDisable(inp_nazv_false && inp_kon_false && inp_nach_false && list_zhnr.isEmpty());
                }
            }
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
