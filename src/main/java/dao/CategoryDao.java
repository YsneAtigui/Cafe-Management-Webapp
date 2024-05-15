/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author yassine
 */
package dao;

import java.util.ArrayList;
import javax.swing.JOptionPane;
import model.Category;
import java.sql.*;

/**
 *
 * @author yassine
 */
public class CategoryDao {

    public static void save(Category category) {
        String query = "insert into category(name) values('" + category.getName() + "')";
        DbOperation.setDataOrDelete(query, "Categoey added Successfully");
    }

    public static ArrayList<Category> getAllRecords() throws SQLException {
        ArrayList<Category> arraylist = new ArrayList<>();

        ResultSet rs = DbOperation.getData("select *from category");
        while (rs.next()) {
            Category category = new Category();
            category.setId(rs.getInt("id"));
            category.setName(rs.getString("name"));
            arraylist.add(category);
        }

        return arraylist;
    }
    public static void update(Category category) {

        String query = "update category set name ='" + category.getName() +"' where id ='" + category.getId() + "'";
        DbOperation.setDataOrDelete(query, "category Updated Successflly");

    }

    public static void delete(String id) {
        String query = "delete from category where id='" + id + "'";
        DbOperation.setDataOrDelete(query, "Categoey Deleted Successfully");
    }
}
