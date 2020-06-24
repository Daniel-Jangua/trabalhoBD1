/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.unespbcc.trabalhobd1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author d-den
 */
public class ConnectionFactory {
    public static Connection createConnection() throws SQLException,ClassNotFoundException{
        String url = "jdbc:mysql://localhost:3306/luderia"; //Nome da base de dados
        String user = "root"; //nome do usuário do MySQL
        String password = "200400"; //senha do MySQL
        Class.forName("com.mysql.jdbc.Driver");
        Connection conexao = null;
        conexao = DriverManager.getConnection(url, user, password);
         
        return conexao;
    }
}
