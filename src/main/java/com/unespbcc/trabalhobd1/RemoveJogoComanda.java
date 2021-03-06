/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.unespbcc.trabalhobd1;

import java.awt.Dimension;
import java.beans.PropertyVetoException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

/**
 *
 * @author d-den
 */
public class RemoveJogoComanda extends javax.swing.JInternalFrame {

    /**
     * Creates new form RemoveJogoComanda
     */
    GerenciaComanda fonte;
    String cpf;
    Connection con;
    public RemoveJogoComanda(GerenciaComanda f, String cpf) {
        initComponents();
        fonte = f;
        this.cpf = cpf;
        try {
            con = ConnectionFactory.createConnection();
        } catch (SQLException ex) {
            Logger.getLogger(ResultadoBuscaCli.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ResultadoBuscaCli.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        txtCodJogo = new javax.swing.JTextField();
        btnCancelaRemoveJogo = new javax.swing.JButton();
        btnRemoveJogo = new javax.swing.JButton();

        setClosable(true);
        setTitle("Remover Jogo");
        addInternalFrameListener(new javax.swing.event.InternalFrameListener() {
            public void internalFrameActivated(javax.swing.event.InternalFrameEvent evt) {
                formInternalFrameActivated(evt);
            }
            public void internalFrameClosed(javax.swing.event.InternalFrameEvent evt) {
                formInternalFrameClosed(evt);
            }
            public void internalFrameClosing(javax.swing.event.InternalFrameEvent evt) {
            }
            public void internalFrameDeactivated(javax.swing.event.InternalFrameEvent evt) {
            }
            public void internalFrameDeiconified(javax.swing.event.InternalFrameEvent evt) {
            }
            public void internalFrameIconified(javax.swing.event.InternalFrameEvent evt) {
            }
            public void internalFrameOpened(javax.swing.event.InternalFrameEvent evt) {
            }
        });

        jLabel1.setText("Código do Jogo:");

        btnCancelaRemoveJogo.setText("Cancelar");
        btnCancelaRemoveJogo.setPreferredSize(new java.awt.Dimension(100, 23));
        btnCancelaRemoveJogo.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnCancelaRemoveJogoActionPerformed(evt);
            }
        });

        btnRemoveJogo.setText("Remover");
        btnRemoveJogo.setPreferredSize(new java.awt.Dimension(100, 23));
        btnRemoveJogo.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnRemoveJogoActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel1)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(txtCodJogo))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(btnCancelaRemoveJogo, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 124, Short.MAX_VALUE)
                        .addComponent(btnRemoveJogo, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel1)
                    .addComponent(txtCodJogo, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnCancelaRemoveJogo, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btnRemoveJogo, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(23, Short.MAX_VALUE))
        );

        setBounds(0, 0, 360, 125);
    }// </editor-fold>//GEN-END:initComponents

    private void btnCancelaRemoveJogoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnCancelaRemoveJogoActionPerformed
        // TODO add your handling code here:
        dispose();
    }//GEN-LAST:event_btnCancelaRemoveJogoActionPerformed

    private void formInternalFrameActivated(javax.swing.event.InternalFrameEvent evt) {//GEN-FIRST:event_formInternalFrameActivated
        // TODO add your handling code here:
    }//GEN-LAST:event_formInternalFrameActivated

    private void formInternalFrameClosed(javax.swing.event.InternalFrameEvent evt) {//GEN-FIRST:event_formInternalFrameClosed
        try {
            // TODO add your handling code here:
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(RemoveJogoComanda.class.getName()).log(Level.SEVERE, null, ex);
        }
        fonte.btnRemoveJogo.setEnabled(true);
    }//GEN-LAST:event_formInternalFrameClosed

    private void btnRemoveJogoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnRemoveJogoActionPerformed
        // TODO add your handling code here:
        String sql = "DELETE FROM comanda_compra_jogos WHERE cpf_cliente = "+cpf+" AND codigo = "+txtCodJogo.getText();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.executeUpdate();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(fonte.jp, "Não foi possível realizar remover o jogo!\n"+ex.toString(),"Erro",JOptionPane.ERROR_MESSAGE);
            return;
        }
        JOptionPane.showMessageDialog(fonte.jp, "Jogo removido com sucesso!","Remoção",JOptionPane.INFORMATION_MESSAGE);
        txtCodJogo.setText("");
        
        GerenciaComanda gerenciaComanda = new GerenciaComanda(cpf,fonte.jp);
        fonte.jp.jDesktopPane1.add(gerenciaComanda);
        Dimension d = fonte.jp.jDesktopPane1.getSize();
        gerenciaComanda.setLocation((d.width - gerenciaComanda.getSize().width) / 2, (d.height - gerenciaComanda.getSize().height) / 2);
        gerenciaComanda.setVisible(true);
        fonte.dispose();
        this.moveToFront();
        try {
            this.setSelected(true);
        } catch (PropertyVetoException ex) {
            Logger.getLogger(AddItemComanda.class.getName()).log(Level.SEVERE, null, ex);
        }
        fonte = gerenciaComanda;
    }//GEN-LAST:event_btnRemoveJogoActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnCancelaRemoveJogo;
    private javax.swing.JButton btnRemoveJogo;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JTextField txtCodJogo;
    // End of variables declaration//GEN-END:variables
}
