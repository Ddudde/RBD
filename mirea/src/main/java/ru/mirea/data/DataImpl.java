package ru.mirea.data;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.mirea.Controllers.ModelController;

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
    public static final Map<String, User> map = new HashMap<>();

    @Autowired
    public DataImpl(AbonementRep abonementRep, AdminRep adminRep, Autor_po_kniggamRep autor_po_kniggamRep, Autor_userRep autor_userRep, LibrarianRep librarianRep, NewsRep newsRep, ReaderRep readerRep, UserRep userRep) {
        this.abonementRep = abonementRep;
        this.adminRep = adminRep;
        this.autor_po_kniggamRep = autor_po_kniggamRep;
        this.autor_userRep = autor_userRep;
        this.librarianRep = librarianRep;
        this.newsRep = newsRep;
        this.readerRep = readerRep;
        this.userRep = userRep;
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

    public List<News> getAllNews() {
        return newsRep.findAll();
    }

    public void delete(int id) {
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
