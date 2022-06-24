package ru.app.data;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.app.Controllers.ModelController;
import ru.app.data.inter.*;
import ru.app.data.model.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class DataImpl {
    private final AbonementRep abonementRep;

    private final AdminRep adminRep;

    private final Autor_po_kniggamRep autor_po_kniggamRep;

    private final Autor_userRep autor_userRep;

    private final LibrarianRep librarianRep;

    private final NewsRep newsRep;

    private final ReaderRep readerRep;

    private final UserRep userRep;

    private final KniggaRep kniggaRep;

    private final OrderedKniggaRep orderedKniggaRep;

    private final OrderRep orderRep;

    private final PasportRep pasportRep;

    private final ThemRep themRep;

    public static final Map<String, User> map = new HashMap<>();

    @Autowired
    public DataImpl(AbonementRep abonementRep, AdminRep adminRep, Autor_po_kniggamRep autor_po_kniggamRep, Autor_userRep autor_userRep, LibrarianRep librarianRep, NewsRep newsRep, ReaderRep readerRep, UserRep userRep, KniggaRep kniggaRep, OrderedKniggaRep orderedKniggaRep, OrderRep orderRep, PasportRep pasportRep, ThemRep themRep) {
        this.abonementRep = abonementRep;
        this.adminRep = adminRep;
        this.autor_po_kniggamRep = autor_po_kniggamRep;
        this.autor_userRep = autor_userRep;
        this.librarianRep = librarianRep;
        this.newsRep = newsRep;
        this.readerRep = readerRep;
        this.userRep = userRep;
        this.kniggaRep = kniggaRep;
        this.orderedKniggaRep = orderedKniggaRep;
        this.orderRep = orderRep;
        this.pasportRep = pasportRep;
        this.themRep = themRep;
    }

    public void addorsave(User user) {
        if(ModelController.inet) {
            userRep.save(user);
        }
        map.put(user.getUsername(), user);
    }

    public List<User> getAllUsers() {
        return ModelController.inet ? userRep.findAll() : map.values().stream().toList();
    }

    public List<Knigga> getAllKniggas() {
        return kniggaRep.findAll();
    }

    public List<Them> getAllThemas() {
        return themRep.findAll();
    }

    public List<Knigga> getAllKniggasById_id(Integer id_id) {
        return kniggaRep.findByIdid(id_id);
    }

    public Them getThemeById(Integer id)
    {
        if(themRep.findById(id).isPresent())
            return themRep.findById(id).get();
        return null;
    }

    public Autor_po_kniggam getAutor_po_kniggamById(Integer id) {
        if(autor_po_kniggamRep.findById(id).isPresent())
            return autor_po_kniggamRep.findById(id).get();
        return null;
    }

    public List<News> getAllNews() {
        return newsRep.findAll();
    }

    public void delete(Integer id) {
        if(ModelController.inet)
            userRep.delete(userRep.getById(id));
    }

    public void delete(String log) {
        if(ModelController.inet)
            userRep.delete(getuser(log));
    }

    public User getuser(String log)
    {
        User user = ModelController.inet ? userRep.findByUsername(log) : map.get(log);
        if(user != null) map.put(user.getUsername(), user);
        return user;
    }

    public boolean checkpar(String log, String par)
    {
        User user = getuser(log);
        if (user == null) return false;
        return user.conf_auth(par);
    }
}
