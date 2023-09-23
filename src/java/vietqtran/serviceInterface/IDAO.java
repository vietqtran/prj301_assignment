/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package vietqtran.serviceInterface;

import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author tranq
 * @param <T>
 */
public interface IDAO<T> {

    void add(T t) throws SQLException;

    List<T> getAll() throws SQLException;

    T get(long id) throws SQLException;

    void update(T t) throws SQLException;

    void delete(long id) throws SQLException;

}
